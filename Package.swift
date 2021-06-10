// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BinaryDecoder",
    products: [
        .library(name: "BinaryDecoder", targets: ["BinaryDecoder"])
    ],
    dependencies: [
        .package(name: "Functional", url: "git@github.com:spacenation/functional-swift.git", from: "0.4.9"),
        .package(name: "Binary", url: "git@github.com:spacenation/binary-swift.git", from: "0.1.1")
    ],
    targets: [
        .target(name: "BinaryDecoder", dependencies: ["Functional", "Binary"]),
        .testTarget(name: "BinaryDecoderTests", dependencies: ["BinaryDecoder"])
    ]
)
