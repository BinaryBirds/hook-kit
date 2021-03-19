// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "hook-kit",
    products: [
        .library(name: "HookKit", targets: ["HookKit"]),
    ],
    targets: [
        .target(name: "HookKit"),
        .testTarget(name: "HookKitTests", dependencies: ["HookKit"]),
    ]
)
