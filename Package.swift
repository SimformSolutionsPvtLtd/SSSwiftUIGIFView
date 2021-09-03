// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SSSwiftUIGIFView",
    platforms: [
        .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        .library(name: "SSSwiftUIGIFView", type: .dynamic, targets: ["SSSwiftUIGIFView"]),
    ],
    targets: [
        .target(name: "SSSwiftUIGIFView", path: "Source"),
    ]
)
