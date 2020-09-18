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
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", from: "3.1.8")
    ],
    targets: [
        .target(
            name: "Mistica",
            dependencies: [
                "Lottie"
            ],
            path: "Mistica",
            exclude: [
                "Resources",
                "SupportFiles",
                "Components/Badge/docs",
                "Components/Badge/README.md",
                "Components/Button/docs",
                "Components/Button/README.md",
                "Components/Controls/README.md",
                "Components/Crouton/docs",
                "Components/Crouton/README.md",
                "Components/Feedback/docs",
                "Components/Feedback/README.md",
                "Components/Form/docs",
                "Components/Form/README.md",
                "Components/Header/docs",
                "Components/Header/README.md",
                "Components/HighlightedCard/docs",
                "Components/HighlightedCard/README.md",
                "Components/InputField/docs",
                "Components/InputField/README.md",
                "Components/Lists/docs",
                "Components/Lists/README.md",
                "Components/Popover/docs",
                "Components/Popover/README.md",
                "Components/ScrollContentIndicator/docs",
                "Components/ScrollContentIndicator/README.md",
                "Components/SectionTitle/docs",
                "Components/SectionTitle/README.md",
                "Components/SegmentSelector/docs",
                "Components/SegmentSelector/README.md",
                "Components/Tag/docs",
                "Components/Tag/README.md",
                "Components/ViewStates/docs",
                "Components/ViewStates/README.md",
            ],
            resources: [
                .process("Resources")
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
