// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CollectionViewCellKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CollectionViewCellKit",
            targets: ["CollectionViewCellKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CollectionViewCellKit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "CollectionViewCellKitTests",
            dependencies: ["CollectionViewCellKit"]
        ),
    ]
)
