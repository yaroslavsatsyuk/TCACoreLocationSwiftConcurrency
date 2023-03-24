// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tca-core-location-swift-concurrency",
    platforms: [
       .iOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "tca-core-location-swift-concurrency",
            targets: ["tca-core-location-swift-concurrency"]),
    ],
    dependencies: [
         .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "0.2.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "tca-core-location-swift-concurrency",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies"),
            ]),
        .testTarget(
            name: "tca-core-location-swift-concurrencyTests",
            dependencies: ["tca-core-location-swift-concurrency"]),
    ]
)
