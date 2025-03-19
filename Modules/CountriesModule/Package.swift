// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountriesModule",
    platforms: [
        .iOS(.v16) // Ensure it supports iOS properly
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CountriesModule",
            targets: ["CountriesModule"]),
    ],
    dependencies: [
        // Declare dependencies if CoreModule and UIModule are external packages
        .package(name: "CoreModule", path: "../CoreModule"),
        .package(name: "UIModule", path: "../UIModule")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CountriesModule",
            dependencies: [
                "CoreModule",
                "UIModule"
            ]
        ),
        .testTarget(
            name: "CountriesModuleTests",
            dependencies: ["CountriesModule"]
        ),
    ]
)
