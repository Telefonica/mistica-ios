# Script used to change the version number on Mistica
if [[ ! $1 =~ (0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-((0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*))*))?(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))? ]]; then
    echo "No valid version supplied"
    exit 1
fi

VERSION_NUMBER=$1
echo "Updating podspec, xcconfig and mistica catalog version number to $VERSION_NUMBER"

# Execute from the root project folder
cd Mistica &>/dev/null
cd .. &>/dev/null

sed -i '' -E "s/(s.version[[:space:]]+=[[:space:]]+').*(')/\1$VERSION_NUMBER\2/" Mistica.podspec
sed -i '' -E "s/(s.version[[:space:]]+=[[:space:]]+').*(')/\1$VERSION_NUMBER\2/" MisticaSwiftUI.podspec
sed -i '' -E "s/(VERSION_NUMBER = ).*/\1$VERSION_NUMBER/" Sources/SupportFiles/Mistica.xcconfig
sed -i '' -E "s/(VERSION_NUMBER = ).*/\1$VERSION_NUMBER/" MisticaCatalog/SupportFiles/Config.xcconfig
