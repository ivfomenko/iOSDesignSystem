// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [:]
    )
#endif

let package = Package(
    name: "iOSDesignSystemKit",
    dependencies: [
        .package(path: "../../"),
    ]
)
