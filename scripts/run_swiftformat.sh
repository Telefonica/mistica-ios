# Run SwiftFormant

if which swiftformat >/dev/null; then
	swiftformat --swiftversion 5.1 $1 --header "\n {file}\n\n Made with ❤️ by Novum\n\n Copyright © 2020 Telefonica. All rights reserved.\n "
else
	echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat or run brew install swiftformat"
fi
