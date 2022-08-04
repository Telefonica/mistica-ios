// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Mistica",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Mistica",
            targets: ["Mistica", "MisticaCommon"]
        ),
        .library(
            name: "MisticaSwiftUI",
            targets: ["MisticaSwiftUI", "MisticaCommon"]
        )
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", .exact("3.1.8")),
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .exact("1.8.2"))
    ],
    targets: [
        .target(
            name: "MisticaCommon",
            dependencies: [
                "Lottie"
            ],
            exclude: [
                "Fonts/README.md",
                "Controls/README.md"
            ]
        ),

        .testTarget(
            name: "MisticaCommonTests",
            dependencies: [
                "MisticaCommon",
                "SnapshotTesting"
            ],
            exclude: [
                "Fonts/__Snapshots__"
            ],
            resources: [
                .process("Resources/Telefonica-Bold.otf"),
                .process("Resources/Telefonica-Light.otf"),
                .process("Resources/Telefonica-Regular.otf")
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),

        .target(
            name: "MisticaSwiftUI",
            dependencies: [
                "Lottie",
                "MisticaCommon"
            ],
            exclude: [
                "Components/Button/README.md",
                "Components/Badge/README.md",
                "Components/Tag/README.md",
                "Components/List/README.md",
                "Components/List/docs",
                "Components/Feedback/README.md",
                "Components/Feedback/docs",
                "Components/Cards/README.md",
                "Components/Cards/docs",
                "Components/Checkbox/README.md",
                "Components/RadioButton/README.md",
                "Components/Tabs/README.md",
                "Components/Callout/README.md",
                "Components/Callout/docs",
                "Components/Callout/docs",
                "Components/Carousel/README.md",
                "Components/EmptyState/README.md",
                "Components/Chip/README.md"
            ]
        ),

        .testTarget(
            name: "MisticaSwiftUITests",
            dependencies: [
                "MisticaSwiftUI",
                "SnapshotTesting"
            ],
            exclude: [
                "UI/__Snapshots__"
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),

        .target(
            name: "Mistica",
            dependencies: [
                "Lottie",
                "MisticaCommon"
            ],
            exclude: [
                "Components/Badge/docs",
                "Components/Badge/README.md",
                "Components/Button/docs",
                "Components/Button/README.md",
                "Components/Checkbox/README.md",
                "Components/Crouton/docs",
                "Components/Crouton/README.md",
                "Components/Feedback/docs",
                "Components/Feedback/README.md",
                "Components/Form/docs",
                "Components/Form/README.md",
                "Components/Header/docs",
                "Components/Header/README.md",
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
                "Components/Filter/docs",
                "Components/Filter/README.md",
                "Components/Switch/README.md",
                "Components/Tag/docs",
                "Components/Tag/README.md",
                "Components/ViewStates/docs",
                "Components/ViewStates/README.md",
                "Components/Stepper/README.md",
                "Components/Stepper/docs",
                "Components/Cards/README.md",
                "Components/Cards/docs",
                "Components/Tabs/README.md",
                "Components/Callout/README.md",
                "Components/Callout/docs",
                "Components/EmptyState/README.md",
                "Components/EmptyState/docs"
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
            exclude: [
                "UI/__Snapshots__"
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        )
    ]
)
