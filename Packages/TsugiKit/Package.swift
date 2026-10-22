// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TsugiKit",
    platforms: [
        .iOS(.v26),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "TsugiGraphQL",
            targets: ["TsugiGraphQL"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apollographql/apollo-ios.git",
            .upToNextMajor(from: "2.0.0")
        )
    ],
    targets: [
        .target(
            name: "TsugiGraphQL",
            dependencies: [
                .product(name: "Apollo", package: "apollo-ios")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
