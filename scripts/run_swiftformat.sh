# Run SwiftFormat
BUILDTOOLS=${2:-buildTools}
SDKROOT=macosx

swift run -c release --package-path "$BUILDTOOLS" swiftformat $1
