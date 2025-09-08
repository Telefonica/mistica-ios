.PHONY: help setup format test simulator archive export clean  skin

# Simulator
OS_VERSION := 18.5
DEVICE_NAME := iPhone 16
SIMULATOR_NAME := $(DEVICE_NAME) ($(OS_VERSION))
GET_INSTALLED_SIMULATOR_NAME := $(shell xcrun simctl list | grep -o "$(SIMULATOR_NAME)" | head -1)
DESTINATION := platform=iOS Simulator,OS=$(OS_VERSION),name=$(DEVICE_NAME)

# Paths
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TMP_ROOT_PATH := $(ROOT_DIR)/tmp
TEST_OUTPUT_PATH := $(TMP_ROOT_PATH)/test_output
SCREENSHOT_DIFFS_OUTPUT_PATH = $(TEST_OUTPUT_PATH)/diff_output
XCRESULT_FILE_PATH := $(TEST_OUTPUT_PATH)/$(SCHEMA).xcresult

# Export config
SCHEMA := MisticaCatalog
TEST_SCHEMA := Mistica
PROJECT_PATH := MisticaCatalog/MisticaCatalog.xcodeproj
BUILD_PATH := $(ROOT_DIR)/build
EXPORTED_OPTIONS_PATH := $(ROOT_DIR)/enterprise.plist
ARCHIVE_PATH := $(TMP_ROOT_PATH)/ios.xcarchive
XCODEBUILD := set -o pipefail && xcodebuild
MISTICA_DESIGN_TOKENS_PATH := /tokens
MISTICA_DESIGN_URL := https://raw.githubusercontent.com/Telefonica/mistica-design/$(ref)/tokens

# Xcode
ifneq ($(origin GITHUB_ACTION),undefined)
export DEVELOPER_DIR=/Applications/Xcode_16.4.app/Contents/Developer
endif

# Targets
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  setup    				to set up dependencies"
	@echo "  format    				to execute swiftformat in Sources directory"
	@echo "  test     				to build and test the main target"
	@echo "  simulator				to install the simulator for testing"
	@echo "  export					to export the archived project as an .ipa"
	@echo "  clean    				to remove all temporal files"
	@echo "  skin					to regenerate and format tokens from mistica design"

trace:
	@echo "Current xcodebuild configuration"
	@xcodebuild -version
	@echo "Available schemas"
	@xcodebuild -list -json
	@echo "Available devices"
	@xcrun xctrace list devices
	@echo "Available runtimes"
	@xcrun simctl list runtimes
	@echo "Available SDKs"
	@xcodebuild -showsdks
	@xcrun --sdk iphonesimulator --show-sdk-path

setup: trace
	@echo "Installing dependencies..."
	@command -v xcparse >/dev/null 2>&1 || brew install chargepoint/xcparse/xcparse
	@command -v xcbeautify >/dev/null 2>&1 || brew install xcbeautify

skinGeneratorSetup:
	@echo "Installing tokens generator dependencies"
	@brew ls node --versions || brew install node
	cd scripts/mistica-skin-generator && npm install

format:
	Scripts/swiftformat .

test: clean setup simulator
	@echo "Testing with simulator $(SIMULATOR_NAME)"
	$(XCODEBUILD) build-for-testing -scheme $(TEST_SCHEMA) -destination "$(DESTINATION)" | xcbeautify
	$(XCODEBUILD) test-without-building -scheme $(TEST_SCHEMA) -resultBundlePath $(XCRESULT_FILE_PATH) -destination "$(DESTINATION)" | xcbeautify

extract_tests_attachments:
	@xcparse attachments $(XCRESULT_FILE_PATH) $(SCREENSHOT_DIFFS_OUTPUT_PATH) --uti public.plain-text public.image --test

simulator:
	@echo "Installing simulator $(SIMULATOR_NAME)"
ifneq ($(GET_INSTALLED_SIMULATOR_NAME), $(SIMULATOR_NAME))
	@echo "Installing simulator $(SIMULATOR_NAME)"
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
	$(XCODEBUILD) -project "$(PROJECT_PATH)" -scheme $(SCHEMA) clean archive -configuration release -sdk iphoneos -archivePath "$(ARCHIVE_PATH)" -destination generic/platform=iOS | xcbeautify

	@echo "Exporting..."
	$(XCODEBUILD) -exportArchive -archivePath "$(ARCHIVE_PATH)" -exportPath "$(TMP_ROOT_PATH)" -exportOptionsPlist "$(EXPORTED_OPTIONS_PATH)" | xcbeautify

	@echo "Moving artifacts to $(BUILD_PATH)"
	@mkdir -p "$(BUILD_PATH)"
	@find "$(TMP_ROOT_PATH)" -name "*.ipa" | xargs -I '{}' mv {} "$(BUILD_PATH)/ios.ipa"
	@find "$(TMP_ROOT_PATH)" -name "*.dSYM" | xargs -I '{}' mv {} "$(BUILD_PATH)/ios.dSYM"

	@rm -rf "$(TMP_ROOT_PATH)"

tokensGeneration:
	@echo "Executing tokens generation tool..."
	cd scripts/mistica-skin-generator && npm run generate

skin:  tokensGeneration format
