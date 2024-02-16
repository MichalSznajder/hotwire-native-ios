// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Turbo",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Turbo",
            targets: ["Turbo"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs", .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/envoy/Embassy.git", .upToNextMajor(from: "4.1.4"))
    ],
    targets: [
        .target(
            name: "Turbo",
            dependencies: [],
            path: "Source",
            resources: [
                .copy("WebView/turbo.js")
            ]
        ),
        .testTarget(
            name: "TurboTests",
            dependencies: [
                "Turbo",
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs"),
                .product(name: "Embassy", package: "Embassy")
            ],
            path: "Tests",
            resources: [
                .copy("Fixtures"),
                .copy("Server")
            ]
        )
    ]
)
