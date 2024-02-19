.PHONY: help setup format test simulator archive export clean skinGeneratorSetup colorPaletteGeneration cornerRadiusGeneration fontWeightsGeneration fontSizesGeneration skin

# Simulator
OS_VERSION := 17.2
DEVICE_NAME := iPhone 15
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
TEST_SCHEMA := Mistica
PROJECT_PATH := MisticaCatalog/MisticaCatalog.xcodeproj
BUILD_PATH := $(ROOT_DIR)/build
EXPORTED_OPTIONS_PATH := $(ROOT_DIR)/enterprise.plist
ARCHIVE_PATH := $(TMP_ROOT_PATH)/ios.xcarchive
XCODEBUILD := set -o pipefail && xcodebuild
MISTICA_DESIGN_PATH := $(ROOT_DIR)/tmp/mistica-design
MISTICA_DESIGN_TOKENS_PATH := /tokens
MISTICA_DESIGN_URL := https://raw.githubusercontent.com/Telefonica/mistica-design/$(ref)/tokens

#Skin tokens config
#These variables will be used to get the json file from mistica design repository and later to create the appropiate file and class/struct names. If a new brand/skin needs to be added, it should be added here. All of the brand names should be in lowercase.
Movistar:= movistar
Blau:= blau
O2:= o2
Vivo:= vivo
VivoNew:= vivo-new
Telefonica:= telefonica
BRAND_FILES:= $(Movistar) $(Blau) $(O2) $(Vivo) $(VivoNew) $(Telefonica) # List of all the brand names that will be procesed.

# Xcode
ifneq ($(origin GITHUB_ACTION),undefined)
export DEVELOPER_DIR=/Applications/Xcode-15.2.app/Contents/Developer
endif

# TokenGenerator func to be used in all token generators.
define tokenGenerator
	@echo "Generating Mistica $(2) interfaces"
	hygen $(1) Mistica$(2) --json $(MISTICA_DESIGN_PATH)$(MISTICA_DESIGN_TOKENS_PATH)/$(Movistar).json

	for key in $(BRAND_FILES) ; do \
		echo "Generating $$key $(2) palette"; \
		hygen $(1) Brand$(2) --name $$key --json $(MISTICA_DESIGN_PATH)$(MISTICA_DESIGN_TOKENS_PATH)/$$key.json ; \
	done
endef

# Targets
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  setup    				to set up dependencies"
	@echo "  format    				to execute swiftformat in Sources directory"
	@echo "  test     				to build and test the main target"
	@echo "  simulator				to install the simulator for testing"
	@echo "  export				to export the archived project as an .ipa"
	@echo "  clean    				to remove all temporal files"
	@echo "  skinGeneratorSetup    		to setup skin dependencies"
	@echo "  colorPaletteGeneration ref=<ref>  	to setup and regenerate MisticaColors with new palettes from mistica design where <ref> is the branch from mistica-design repository from where we want to generate the tokens"
	@echo "  cornerRadiusGeneration ref=<ref> 	to setup and regenerate MisticaCornerRadius with new palettes from mistica design where <ref> is the branch from mistica-design repository from where we want to generate the tokens"
	@echo "  fontWeightsGeneration ref=<ref> 	to setup and regenerate MisticaFontWeights with new palettes from mistica design where <ref> is the branch from mistica-design repository from where we want to generate the tokens"
	@echo "  fontSizesGeneration ref=<ref> 	to setup and regenerate MisticaFontSizes with new palettes from mistica design where <ref> is the branch from mistica-design repository from where we want to generate the tokens"
	@echo "  skin ref=<ref>			to setup, regenerate and format tokens from mistica design where <ref> is the branch from mistica-design repository from where we want to generate the tokens"

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

skinGeneratorSetup:
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

getMisticaDesignTokenFiles:
	@echo "Obtaining mistica token files"
	for key in $(BRAND_FILES) ; do \
		curl -o $(MISTICA_DESIGN_PATH)$(MISTICA_DESIGN_TOKENS_PATH)/$$key.json --create-dirs $(MISTICA_DESIGN_URL)/$$key.json ; \
	done

colorPaletteGeneration: skinGeneratorSetup getMisticaDesignTokenFiles
	$(call tokenGenerator,ColorTokenGenerator,Colors)

cornerRadiusGeneration: skinGeneratorSetup getMisticaDesignTokenFiles
	$(call tokenGenerator,CornerRadiusTokenGenerator,CornerRadius)

fontWeightsGeneration: skinGeneratorSetup getMisticaDesignTokenFiles
	$(call tokenGenerator,FontWeightsTokenGenerator,FontWeights)

fontSizesGeneration: skinGeneratorSetup getMisticaDesignTokenFiles
	$(call tokenGenerator,FontSizesTokenGenerator,FontSizes)

removeMisticaDesignTokenFolder:
	rm -rf $(MISTICA_DESIGN_PATH)

skin: colorPaletteGeneration cornerRadiusGeneration fontWeightsGeneration fontSizesGeneration removeMisticaDesignTokenFolder format
