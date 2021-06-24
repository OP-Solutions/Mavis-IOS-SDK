// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let notSimulator:TargetDependencyCondition = .when(platforms: [.iOS,.watchOS])

let package = Package(
    name: "MavisSDK",
    products: [
        .library(
            name: "MavisSDK",
            type: .dynamic,
            targets: ["MavisSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MavisSDK",
            dependencies: [
                .byName(name: "UnityFramework",condition: notSimulator),
                .byName(name: "WikitudeSDK", condition: notSimulator)]),
        .binaryTarget(
            name: "UnityFramework",
            path: "UnityFramework.xcframework"),
        .binaryTarget(
            name: "WikitudeSDK",
            path: "WikitudeSDK.xcframework")
    ]
)
