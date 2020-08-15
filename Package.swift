// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BinaryCoder",
    products: [
        .library(name: "BinaryCoder", targets: ["BinaryCoder"])
    ],
    targets: [
        .target(name: "BinaryCoder", dependencies: []),
        .testTarget(name: "BinaryCoderTests", dependencies: ["BinaryCoder"])
    ]
)
