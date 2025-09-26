// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Mistica",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Mistica",
            targets: ["Mistica", "MisticaCommon", "MisticaSwiftUI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.5.1"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", exact: "5.19.1"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSVGCoder.git", exact: "1.7.0")
    ],
    targets: [
        .target(
            name: "MisticaCommon",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm")
            ],
            exclude: [
                "Fonts/README.md",
                "Controls/README.md"
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),

        .target(
            name: "MisticaSwiftUI",
            dependencies: [
                "MisticaCommon",
                .product(name: "Lottie", package: "lottie-spm")
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
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),
        .target(
            name: "Mistica",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm"),
                .product(name: "SDWebImage", package: "SDWebImage"),
                .product(name: "SDWebImageSVGCoder", package: "SDWebImageSVGCoder"),
                "MisticaCommon"
            ],
            exclude: [
                "Components/Badge/docs",
                "Components/Badge/README.md",
                "Components/Button/docs",
                "Components/Button/README.md",
                "Components/Checkbox/README.md",
                "Components/Snackbar/docs",
                "Components/Snackbar/README.md",
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
                "Components/EmptyState/docs",
                "Components/Sheet/docs"
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),
    ]
)
