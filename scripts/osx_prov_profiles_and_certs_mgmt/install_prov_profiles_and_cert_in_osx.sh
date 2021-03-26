#!/bin/bash

set -e

source ./scripts/osx_prov_profiles_and_certs_mgmt/common-functions

show_help () {
	echo "usage: $(basename $0) [-i -d -x|-u -d -x|-h]"
	echo "Example for installing and dry-run on: $(basename $0) -i -d"
	exit 0
}

get_uuid () {
	local mobile_provision_file=$1
	local uuid=$(security cms -D -i ${mobile_provision_file} | grep -aA1 UUID | grep -o "[-a-zA-Z0-9]\{36\}")
	echo "$uuid"
}

do_cmd() {
	if [ $dry_run -ne 0 ]; then
		echo "$@"
	else
		eval "$@"
	fi
}

create_keychain () {
	cmd="security create-keychain -p $MY_KEYCHAIN_PASSWORD $MY_KEYCHAIN"
	do_cmd $cmd
	local previous_keychains=$(security list-keychains -d user | sed s/\"//g)
	echo "previous keychains: $previous_keychains"
	cmd="security list-keychains -d user -s $MY_KEYCHAIN $previous_keychains"
	do_cmd $cmd
	cmd="security set-keychain-settings $MY_KEYCHAIN"
	do_cmd $cmd
	cmd="security unlock-keychain -p "$MY_KEYCHAIN_PASSWORD" ~/Library/Keychains/${MY_KEYCHAIN}-db"
	do_cmd $cmd
}

install_cert () {
	local cert_file=$1
	local cert_vault_pwd=$2
	local cert_pwd=$(set_cert_password $cert_vault_pwd)
	if ! security list-keychains -d user | grep -q "$MY_KEYCHAIN"; then
		echo "Creating keychain: $MY_KEYCHAIN"
		create_keychain
	else
		echo "keychain: $MY_KEYCHAIN already exists"
	fi
	cmd="security import $file -k "$MY_KEYCHAIN" $cert_pwd -T /usr/bin/codesign  -T /usr/bin/productsign -T /usr/bin/security"
	do_cmd $cmd
	local cert_identity=$(security find-identity -v -p codesigning "$MY_KEYCHAIN" | head -1 | grep '"' | \
						  sed -e 's/[^"]*"//' -e 's/".*//')
	cmd="security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k -s -k $MY_KEYCHAIN_PASSWORD -D '${cert_identity}' -t private $MY_KEYCHAIN"
	do_cmd $cmd
}

install_provision_files_and_cert () {
	local file=$1
	local cert_vault_pwd=$2
	if is_cert_file $file; then
		echo "Installing cert_file: $file"
		install_cert $file $cert_vault_pwd
	else
		local uuid=$(get_uuid $file)
		echo "Installing mobile_provision_file: $file: uid: $uuid in path:$PROVISIONING_PROFILES_PATH_CMD"
		cmd="cp $file $PROVISIONING_PROFILES_PATH_CMD${uuid}.mobileprovision"
		do_cmd $cmd
	fi
}

get_common_name_cert() {
	local file=$1
	local cert_vault_pwd=$2
	local common_name=""
	if [[ ${file} == *.p12 ]]; then
		# https://stackoverflow.com/questions/8500475/working-with-openssl-to-extract-information-from-a-pkcs12-certificate
		local common_name=$(openssl pkcs12 -in $file -passin pass:$cert_vault_pwd -passout pass:$cert_vault_pwd | \
							openssl x509 -subject -noout -nameopt multiline | grep commonName | \
							sed -n 's/ *commonName *= //p')
	elif [[ ${file} == *.cer* ]]; then
		local common_name=$(openssl x509 -inform DER -in $file -noout -subject -nameopt multiline | \
							grep commonName | sed -n 's/ *commonName *= //p')
	fi
	echo "$common_name"
}

delete_certificate() {
	local file=$1
	local cert_vault_pwd=$2
	local common_name=""
	common_name=$(get_common_name_cert $file $cert_vault_pwd)
	exists_command security
	local hashes=$(security find-certificate -p -c "${common_name}" -a -Z | grep SHA-1|awk '{ print $NF }')
	[[ -z "$hashes" ]] && echo "Certificate ${common_name} not found"
	for hash in $hashes; do
		echo "Uninstalling cert $file with commonName: ${common_name} and hash: $hash"
		cmd="security delete-certificate -Z $hash"
		do_cmd $cmd
	done
}

uninstall_provision_files_and_cert () {
	local file=$1
	local cert_vault_pwd=$2
	local common_name=""
	if is_cert_file $file; then
		echo "Uninstalling cert_file: $file"
		delete_certificate $file $cert_vault_pwd
		if security list-keychains -d user | grep -q "$MY_KEYCHAIN"; then
			echo "Deleting keychain: $MY_KEYCHAIN"
			security delete-keychain "$MY_KEYCHAIN"
		else
			echo "keychain: $MY_KEYCHAIN does not exist"
		fi
	else
		local uuid=$(get_uuid $file)
		echo "Uninstalling mobile_provision_file: $file: uid: $uuid in path:${PROVISIONING_PROFILES_PATH_CMD}"
		if [[ -f "$PROVISIONING_PROFILES_PATH${uuid}.mobileprovision" ]] ;then
			cmd="rm $PROVISIONING_PROFILES_PATH_CMD${uuid}.mobileprovision"
			do_cmd $cmd
		else
			echo "Provisioning profile $PROVISIONING_PROFILES_PATH_CMD${uuid}.mobileprovision not found"
		fi
	fi
}

function args() {
	[ $# -eq 0 ] && show_help
	while getopts 'hiudx' OPTION; do
		case "${OPTION}" in
			i)
				install=1
				;;
			u)
				uninstall=1
				;;
			d)
				dry_run=1
				echo "Dry-run ON: Not installing nor uninstalling prov profiles and cert"
				;;
			x)
				set -x
				;;
			h|*)
				show_help
				;;
		esac
	done
	shift $((OPTIND-1))
}

IOS_PROV_FILES_FOLDER="ios_prov_files"
PROVISIONING_PROFILES_PATH_CMD="/Users/tools/Library/MobileDevice/Provisioning\ Profiles/"
PROVISIONING_PROFILES_PATH="/Users/tools/Library/MobileDevice/Provisioning Profiles/"
MY_KEYCHAIN="novum.keychain"
MY_KEYCHAIN_PASSWORD="secret"
install=0
uninstall=0
dry_run=0

args "$@"
prov_profiles_cert_list_in_base64=()
prov_profiles_cert_pwd_list=()
if check_requirements; then
	for ((i=0;i<${#prov_profiles_cert_list_in_base64[@]};++i)); do
		echo "Prov Profiles Cert zip value in base 64 from Vault: ${prov_profiles_cert_list_in_base64[i]}"
		echo "Prov Profiles Cert password from Vault: ${prov_profiles_cert_pwd_list[i]}"
		prov_profiles_version=$(get_prov_profiles_version $BRAND_VARIANT)
		if unzip_files ${prov_profiles_cert_list_in_base64[i]} $IOS_PROV_FILES_FOLDER; then
			final_prov_profiles_folder=$(get_final_prov_profiles_folder $IOS_PROV_FILES_FOLDER $BRAND_VARIANT $prov_profiles_version)
			echo "WTF ${final_prov_profiles_folder}"
			ios_prov_files_and_cert=$(ls ${final_prov_profiles_folder})
			pushd ${final_prov_profiles_folder}  1>/dev/null
			for file in ${ios_prov_files_and_cert}; do
				if [[ $install -ne 0 ]] && [[ $uninstall -ne 0 ]]; then
					echo "$(basename $0) -i and -u option cannot be set at the same time"
					show_help
				elif [ $install -ne 0 ]; then
					install_provision_files_and_cert $file ${prov_profiles_cert_pwd_list[i]}
				elif [ $uninstall -ne 0 ]; then
					uninstall_provision_files_and_cert $file ${prov_profiles_cert_pwd_list[i]}
				fi
			done
			popd 1>/dev/null
		fi
		remove_prov_files $IOS_PROV_FILES_FOLDER
	done
fi