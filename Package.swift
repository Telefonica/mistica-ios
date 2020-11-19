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
            targets: ["Mistica"]
        )
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", .exact("3.1.8")),
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .exact("1.8.2"))
    ],
    targets: [
        .target(
            name: "Mistica",
            dependencies: [
                "Lottie"
            ],
            path: "Mistica/Source",
            exclude: [
                "SupportFiles",
                "Components/Badge/docs",
                "Components/Badge/README.md",
                "Components/Button/docs",
                "Components/Button/README.md",
                "Components/CheckBox/README.md",
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
                "Components/NavigationBar/README.md",
                "Components/Popover/docs",
                "Components/Popover/README.md",
                "Components/RadioButton/README.md",
                "Components/ScrollContentIndicator/docs",
                "Components/ScrollContentIndicator/README.md",
                "Components/SectionTitle/docs",
                "Components/SectionTitle/README.md",
                "Components/SegmentSelector/docs",
                "Components/SegmentSelector/README.md",
                "Components/Switch/README.md",
                "Components/Tag/docs",
                "Components/Tag/README.md",
                "Components/ViewStates/docs",
                "Components/ViewStates/README.md"
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),
        .testTarget(
            name: "MisticaTests",
            dependencies: [
                "Mistica",
                "SnapshotTesting"
            ],
            path: "Mistica/Tests",
            exclude: [
                "UI/__Snapshots__"
            ]
        )
    ]
)
