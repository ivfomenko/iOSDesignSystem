// swift-tools-version: 6.0

@preconcurrency import PackageDescription

let package = Package(
    name: "ios-design-system-kit",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "iOSDesignSystemKit",
            targets: ["iOSDesignSystemKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "iOSDesignSystemKit",
            dependencies: [],
            path: "Package/Sources/iOSDesignSystemKit",
            resources: [
                .process("Icons/Resources/IconTokens.xcassets"),
            ]
        ),
    ]
)
