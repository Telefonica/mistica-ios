.PHONY: help setup format test simulator archive export clean setupSkin tokenColorTemplates skin

# Simulator
OS_VERSION := 16.2
DEVICE_NAME := iPhone 14
SIMULATOR_NAME := $(DEVICE_NAME) ($(OS_VERSION))
GET_INSTALLED_SIMULATOR_NAME := $(shell xcrun simctl list | grep -o "$(SIMULATOR_NAME)" | head -1)

# Paths
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TMP_ROOT_PATH := $(ROOT_DIR)/tmp
TEST_OUTPUT_PATH := $(TMP_ROOT_PATH)/test_output
SCREENSHOT_DIFFS_OUTPUT_PATH = $(TEST_OUTPUT_PATH)/diff_output
XCRESULT_FILE_PATH := $(TEST_OUTPUT_PATH)/$(SCHEMA).xcresult

# Export config
SCHEMA := MisticaCatalog
TEST_SCHEMA := Mistica-Package
PROJECT_PATH := MisticaCatalog/MisticaCatalog.xcodeproj
BUILD_PATH := $(ROOT_DIR)/build
EXPORTED_OPTIONS_PATH := $(ROOT_DIR)/enterprise.plist
ARCHIVE_PATH := $(TMP_ROOT_PATH)/ios.xcarchive
XCODEBUILD := set -o pipefail && xcodebuild
MISTICA_DESIGN_TOKENS := $(ROOT_DIR)/.github/mistica-design/tokens

#Skin tokens config
#All of the brand names should be in lowercase. This variables will be used to get the json file from mistica tokens directory. If new brand is created, it should be added here.
Movistar:= movistar
Blau:= blau
O2:= o2
Vivo:= vivo
BRAND_FILES:= $(Movistar) $(Blau) $(O2) $(Vivo) # List of all the brand file names that will be procesed.

# Xcode
ifneq ($(origin GITHUB_ACTION),undefined)
export DEVELOPER_DIR=/Applications/Xcode-14.2.app/Contents/Developer
endif

# Targets
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  setup    		to set up dependencies"
	@echo "  format    		to execute swiftformat in Sources directory"
	@echo "  test     		to build and test the main target"
	@echo "  simulator		to install the simulator for testing"
	@echo "  export		to export the archived project as an .ipa"
	@echo "  clean    		to remove all temporal files"
	@echo "	 setupSkin		to setup skin dependencies"
	@echo "  tokenColorTemplates 		to setup and regenerate MisticaColors with new palettes from mistica design"
	@echo "skin				to setup, regenerate and format tokens from mistica design"

trace:
	@echo "Current xcodebuild configuration"
	@xcodebuild -version
	@echo "Available schemas"
	@xcodebuild -list -json
	@echo "Available devices"
	@xcrun xctrace list devices
	@xcrun --sdk iphonesimulator --show-sdk-path

setup: trace
	@echo "Installing dependencies..."
	@brew ls chargepoint/xcparse/xcparse --versions || brew install chargepoint/xcparse/xcparse
	@brew ls xcbeautify --versions || brew install xcbeautify

setupSkin:
	@echo "Installing tokens generators dependencies"
	@brew ls node --versions || brew install node
	@brew ls hygen --versions || (brew tap jondot/tap && brew install hygen)

format:
	Scripts/swiftformat .

test: clean setup simulator
	@echo "Testing with simulator $(SIMULATOR_NAME)"
	$(XCODEBUILD) build-for-testing -scheme $(TEST_SCHEMA) -destination "platform=iOS Simulator,name=$(SIMULATOR_NAME)" | xcbeautify
	$(XCODEBUILD) test-without-building -scheme $(TEST_SCHEMA) -resultBundlePath $(XCRESULT_FILE_PATH) -destination "platform=iOS Simulator,name=$(SIMULATOR_NAME)" | xcbeautify

extract_tests_attachments:
	@xcparse attachments $(XCRESULT_FILE_PATH) $(SCREENSHOT_DIFFS_OUTPUT_PATH) --uti public.plain-text public.image --test

simulator:
	@echo "Installing simulator $(SIMULATOR_NAME)"
ifneq ($(GET_INSTALLED_SIMULATOR_NAME), $(SIMULATOR_NAME))
	@echo "Instaling simulator $(SIMULATOR_NAME)"
	@xcrun simctl create "$(SIMULATOR_NAME)" "$(DEVICE_NAME)" iOS$(OS_VERSION)
else
	@echo "Simulator $(SIMULATOR_NAME) already exists"
endif

clean:
	@rm -rf "$(TMP_ROOT_PATH)"

export: clean setup
	@echo "Building $(SCHEMA)"

	@echo "Removing previous build..."
	@rm -rf "$(BUILD_PATH)"

	@echo "Archiving..."
	$(XCODEBUILD) -project "$(PROJECT_PATH)" -scheme $(SCHEMA) clean archive -configuration release -sdk iphoneos -archivePath "$(ARCHIVE_PATH)" | xcbeautify

	@echo "Exporting..."
	$(XCODEBUILD) -exportArchive -archivePath "$(ARCHIVE_PATH)" -exportPath "$(TMP_ROOT_PATH)" -exportOptionsPlist "$(EXPORTED_OPTIONS_PATH)" | xcbeautify

	@echo "Moving artifacts to $(BUILD_PATH)"
	@mkdir -p "$(BUILD_PATH)"
	@find "$(TMP_ROOT_PATH)" -name "*.ipa" | xargs -I '{}' mv {} "$(BUILD_PATH)/ios.ipa"
	@find "$(TMP_ROOT_PATH)" -name "*.dSYM" | xargs -I '{}' mv {} "$(BUILD_PATH)/ios.dSYM"

	@rm -rf "$(TMP_ROOT_PATH)"

tokenColorTemplates: setupSkin
	@echo "Generating Mistica Color Palettes"
	hygen ColorTokenGenerator MisticaColors --json $(MISTICA_DESIGN_TOKENS)/$(Movistar).json # Generates the MisticaColors protocol from the movistar json file.

	# Generates N color palettes for every brand passed in BRAND_FILES
	for key in $(BRAND_FILES) ; do \
		hygen ColorTokenGenerator BrandColors --name $$key --json $(MISTICA_DESIGN_TOKENS)/$$key.json ; \
	done

tokenCornerRadiusTemplates: setupSkin
	@echo "Generating Mistica Corner Radius Palettes"
	hygen CornerRadiusTokenGenerator MisticaCornerRadius --json $(MISTICA_DESIGN_TOKENS)/$(Movistar).json # Generates the MisticaCornerRadius protocol from the movistar json file.

	# Generates N corner radius palettes for every brand passed in BRAND_FILES
	for key in $(BRAND_FILES) ; do \
		hygen CornerRadiusTokenGenerator BrandCornerRadius --name $$key --json $(MISTICA_DESIGN_TOKENS)/$$key.json ; \
	done

skin: tokenColorTemplates tokenCornerRadiusTemplates format

