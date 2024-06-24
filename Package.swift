// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SSSwiftUIGIFView",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SSSwiftUIGIFView",
            targets: ["SSSwiftUIGIFView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SSSwiftUIGIFView",
            path: "Source"),
    ],
    swiftLanguageVersions: [.v5]
)
