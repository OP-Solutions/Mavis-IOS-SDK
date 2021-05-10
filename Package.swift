// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MavisSDK",
    products: [
        .library(
            name: "MavisSDK",
            targets: ["MavisSDK","UnityFramework","WikitudeSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MavisSDK",
            dependencies: ["UnityFramework", "WikitudeSDK"]),
        .binaryTarget(
            name: "UnityFramework",
            path: "UnityFramework.xcframework"),
        .binaryTarget(
            name: "WikitudeSDK",
            path: "WikitudeSDK.xcframework")
    ]
)
