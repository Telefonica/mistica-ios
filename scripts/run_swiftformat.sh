# Run SwiftFormant

if which swiftformat >/dev/null; then
	swiftformat --swiftversion 5.1 $1
else
	echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat or run brew install swiftformat"
fi
