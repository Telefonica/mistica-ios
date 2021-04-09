#!/bin/sh -e

# This script is used to build carthage dependencies with Xcode 12. 

build()
{
	xcconfig='/tmp/static.xcconfig.tmp'
	
	# Remove old config file (otherwise, mktemp may fail)
	rm -f $xcconfig

	# Create a new temporal config file
	: $(mktemp $xcconfig)

	# Force module stability
    echo "BUILD_LIBRARY_FOR_DISTRIBUTION = YES" >> $xcconfig

	# Xcode 12 workaround
	echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64=arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
	echo 'EXCLUDED_ARCHS=$(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT))' >> $xcconfig

	export XCODE_XCCONFIG_FILE="$xcconfig"

	carthage build --platform iOS --no-use-binaries --cache-builds
}

# Update dependency without building
carthage update --no-build

# Build dependency with extra flags to prevent issues in Xcode 12
build
