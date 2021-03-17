// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BinaryDecoder",
    products: [
        .library(name: "BinaryDecoder", targets: ["BinaryDecoder"])
    ],
    dependencies: [
        .package(name: "Decoder", url: "git@github.com:spacenation/decoder.swift.git", from: "0.3.1")
    ],
    targets: [
        .target(name: "BinaryDecoder", dependencies: []),
        .testTarget(name: "BinaryDecoderTests", dependencies: ["BinaryDecoder"])
    ]
)
