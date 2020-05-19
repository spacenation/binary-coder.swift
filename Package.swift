// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Binary",
    products: [
        .library(name: "Binary", targets: ["Binary"])
    ],
    targets: [
        .target(name: "Binary", dependencies: []),
        .testTarget(name: "BinaryTests", dependencies: ["Binary"])
    ]
)
