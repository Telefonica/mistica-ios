.PHONY: help setup format test simulator archive export clean

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
