// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "buildTools",
    platforms: [.macOS(.v10_11)],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.47.1")
    ],
    targets: [.target(name: "buildTools", path: "")]
)
