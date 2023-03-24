// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TCACoreLocationSwiftConcurrency",
    platforms: [
       .iOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TCACoreLocationSwiftConcurrency",
            targets: ["TCACoreLocationSwiftConcurrency"]),
    ],
    dependencies: [
         .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "0.2.0")
    ],
    targets: [
        .target(
            name: "TCACoreLocationSwiftConcurrency",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies"),
            ]),
        .testTarget(
            name: "TCACoreLocationSwiftConcurrencyTests",
            dependencies: ["TCACoreLocationSwiftConcurrency"]),
    ]
)
