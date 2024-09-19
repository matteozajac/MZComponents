// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MZComponents",
    platforms: [.iOS(.v17), .visionOS(.v2)],
    products: [
        .library(
            name: "MZComponents",
            targets: ["MZComponents"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI", from: "3.1.2"),
        .package(url: "https://github.com/ryohey/Zoomable", branch: "main")
    ],
    targets: [
        .target(
            name: "MZComponents",
            dependencies: [
                "SDWebImageSwiftUI",
                "Zoomable"
            ]),
        .testTarget(
            name: "MZComponentsTests",
            dependencies: ["MZComponents"]
        ),
    ]
)
