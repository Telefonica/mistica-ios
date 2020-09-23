#!/bin/bash

source ./scripts/osx_prov_profiles_and_certs_mgmt/common-functions

show_help () {
	echo "usage: $(basename $0) [-c -p -x|-h]"
	echo "Example for checking cert date and debug on: $(basename $0) -c -d"
	exit 0
}

get_expiry_cert_days () {
	local file=$1
	local der=$2
	local expiry_date=$(openssl x509 $der -in $file -noout -enddate | cut -d "=" -f 2)
    local expiry_epoch=$(date -j -f "%b %d %T %Y GMT" "$expiry_date" +%s)
    local now_epoch=$(date +%s)
    local expiry_days="$(( ($expiry_epoch - $now_epoch) / (3600 * 24) ))"
    echo "$expiry_days"
}

check_cert_date () {
	local file=$1
	local cert_vault_pwd=$2
	local der=""
	if [[ ${file} == *.p12 ]]; then
		# https://stackoverflow.com/questions/8500475/working-with-openssl-to-extract-information-from-a-pkcs12-certificate
		local pkcs12_file=pkcs12_file
		openssl pkcs12 -in $file -passin pass:$cert_vault_pwd -passout pass:$cert_vault_pwd > $pkcs12_file
	elif [[ ${file} == *.cer* ]]; then
		local der="-inform DER"
	fi
	expiry_days=$(get_expiry_cert_days $pkcs12_file $der)
	echo "Cert $file will expire in $expiry_days days"
	openssl x509 $der -checkend $(( 24*3600*$CHECK_DAYS_TO_EXPIRE )) -in $pkcs12_file -noout
	if [[ $? -ne 0 ]]; then
		echo "Cert $file will expire in less than $CHECK_DAYS_TO_EXPIRE days"
		invalid=1
	fi
}

get_expiry_prov_profiles_days () {
	local file=$1
	local expiry_date=$2
	local expiry_epoch=$(date -jf"%FT%TZ" "${expiry_date}" +%s)
	local now_epoch=$(date +%s)
	local expiry_days="$(( ($expiry_epoch - $now_epoch) / (3600 * 24) ))"
    echo "$expiry_days"
}

check_provisioning_profiles_date () {
	local file=$1
	local expiry_date=$(security cms -D -i $file | grep -aA1 ExpirationDate| awk -F'[<>]' '/<date>/{print $3}')
	local expiry_days=$(get_expiry_prov_profiles_days $file $expiry_date)
	echo "Provisioning profile $file will expire in $expiry_days days"
	local timestamp_expiry_offset=$(date -jf"%FT%TZ" -v -${CHECK_DAYS_TO_EXPIRE}d "${expiry_date}" +%s)
    local timestamp_now=$(date +%s)
	if [ $timestamp_now -ge $timestamp_expiry_offset ]; then
		echo "Cert $file will expire in less than $CHECK_DAYS_TO_EXPIRE days"
		invalid=1
	fi
}

function args() {
	[ $# -eq 0 ] && show_help
	while getopts 'hcpdx' OPTION; do
		case "${OPTION}" in
			c)
				check_cert_date=1
				;;
			p)
				check_prov_profiles_date=1
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
check_cert_date=0
check_prov_profiles_date=0
invalid=0

args "$@"
prov_profiles_cert_list_in_base64=()
prov_profiles_cert_pwd_list=()
if check_requirements $0; then
	for ((i=0;i<${#prov_profiles_cert_list_in_base64[@]};++i)); do
		echo "Prov Profiles Cert zip value in base 64 from Vault: ${prov_profiles_cert_list_in_base64[i]}"
		echo "Prov Profiles Cert password from Vault: ${prov_profiles_cert_pwd_list[i]}"
		prov_profiles_version=$(get_prov_profiles_version $BRAND_VARIANT)
		if unzip_files ${prov_profiles_cert_list_in_base64[i]} $IOS_PROV_FILES_FOLDER; then
			final_prov_profiles_folder=$(get_final_prov_profiles_folder $IOS_PROV_FILES_FOLDER $BRAND_VARIANT $prov_profiles_version)
			[[ ${final_prov_profiles_folder} == *not\ exist* ]] && exit 1
			ios_prov_files_and_cert=$(ls ${final_prov_profiles_folder})
			pushd ${final_prov_profiles_folder}  1>/dev/null
			for file in ${ios_prov_files_and_cert}; do
				if [ $check_cert_date -ne 0 ]; then
					if is_cert_file $file; then
						check_cert_date $file ${prov_profiles_cert_pwd_list[i]}
					fi
				fi
				if [ $check_prov_profiles_date -ne 0 ]; then
					if !(is_cert_file $file); then
						check_provisioning_profiles_date $file
					fi
				fi
			done
			popd 1>/dev/null
		fi
		remove_prov_files $IOS_PROV_FILES_FOLDER
	done

	if [[ $invalid -ne 0 ]]; then
		exit 1
	else
		exit 0
	fi
fi