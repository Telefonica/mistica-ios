#!/bin/sh -e

# This script is used to update and build carthage dependencies 

build()
{
	xcconfig='/tmp/static.xcconfig.tmp'
	
	# Remove old config file (otherwise, mktemp may fail)
	rm -f $xcconfig

	# Create a new temporal config file
	: $(mktemp $xcconfig)

	# Module stability
	echo "BUILD_LIBRARY_FOR_DISTRIBUTION = YES" >> $xcconfig

	# Reduce binary size by building only archs supported by the Novum client 
    echo "ARCHS = arm64 x86_64" >> $xcconfig 
    export XCODE_XCCONFIG_FILE="$xcconfig" 
    carthage update --platform iOS --use-xcframeworks $carthage_args
}

# Update dependency without building
carthage update --no-build

# Build dependencies
build
