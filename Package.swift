// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "taza",
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Files", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "taza",
            dependencies: ["Files"]),
        .testTarget(
            name: "tazaTests",
            dependencies: ["taza"]),
    ]
)
