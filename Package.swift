// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BinaryDecoder",
    products: [
        .library(name: "BinaryDecoder", targets: ["BinaryDecoder"])
    ],
    dependencies: [
        .package(name: "Decoder", url: "git@github.com:spacenation/swift-decoder.git", from: "0.2.5"),
        .package(name: "Binary", url: "git@github.com:spacenation/swift-binary.git", from: "0.1.7")
    ],
    targets: [
        .target(name: "BinaryDecoder", dependencies: ["Decoder", "Binary"]),
        .testTarget(name: "BinaryDecoderTests", dependencies: ["BinaryDecoder"])
    ]
)
