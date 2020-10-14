// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Mistica",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Mistica",
            targets: ["Mistica"]),
        .library(
            name: "MisticaCatalog",
            targets: ["MisticaCatalog"])
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", .exact("3.1.8"))
    ],
    targets: [
        .target(
            name: "Mistica",
            dependencies: [
                "Lottie"
            ],
            path: "Mistica",
            exclude: [
                "SupportFiles",
                "Source/Components/Badge/docs",
                "Source/Components/Badge/README.md",
                "Source/Components/Button/docs",
                "Source/Components/Button/README.md",
                "Source/Components/CheckBox/README.md",
                "Source/Components/Controls/README.md",
                "Source/Components/Crouton/docs",
                "Source/Components/Crouton/README.md",
                "Source/Components/Feedback/docs",
                "Source/Components/Feedback/README.md",
                "Source/Components/Form/docs",
                "Source/Components/Form/README.md",
                "Source/Components/Header/docs",
                "Source/Components/Header/README.md",
                "Source/Components/HighlightedCard/docs",
                "Source/Components/HighlightedCard/README.md",
                "Source/Components/InputField/docs",
                "Source/Components/InputField/README.md",
                "Source/Components/Lists/docs",
                "Source/Components/Lists/README.md",
                "Source/Components/Popover/docs",
                "Source/Components/Popover/README.md",
                "Source/Components/RadioButton/README.md",
                "Source/Components/ScrollContentIndicator/docs",
                "Source/Components/ScrollContentIndicator/README.md",
                "Source/Components/SectionTitle/docs",
                "Source/Components/SectionTitle/README.md",
                "Source/Components/SegmentSelector/docs",
                "Source/Components/SegmentSelector/README.md",
                "Source/Components/Tag/docs",
                "Source/Components/Tag/README.md",
                "Source/Components/ViewStates/docs",
                "Source/Components/ViewStates/README.md"
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),
        .target(
            name: "MisticaCatalog",
            dependencies: [
                "Mistica"
            ],
            path: "MisticaCatalog",
            exclude: [
                "Resources",
                "SupportFiles"
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        )
    ]
)
