// swift-tools-version:6.1

import PackageDescription

let package = Package(
  name: "SuwayomiAPI",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
    .tvOS(.v15),
    .watchOS(.v8),
    .visionOS(.v1),
  ],
  products: [
    .library(name: "SuwayomiAPI", targets: ["SuwayomiAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios", exact: "2.4.0"),
  ],
  targets: [
    .target(
      name: "SuwayomiAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ],
  swiftLanguageModes: [.v6, .v5]
)
