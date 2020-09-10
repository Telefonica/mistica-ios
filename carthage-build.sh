#!/bin/sh -e

# This script is used to build carthage dependencies with Xcode 12. 

build()
{
    xcconfig=$(mktemp /tmp/static.xcconfig.tmp)
	trap 'rm -f "$xcconfig"' INT TERM HUP EXIT
	
	# Xcode 12 workaround
	echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64=arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
	echo 'EXCLUDED_ARCHS=$(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT))' >> $xcconfig

	export XCODE_XCCONFIG_FILE="$xcconfig"

	carthage build --platform iOS --no-use-binaries
}

# Update dependency without building
carthage update --no-build --use-ssh

# Build dependency with extra flags to prevent issues in Xcode 12
build
