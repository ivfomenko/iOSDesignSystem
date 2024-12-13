import ProjectDescription

let project = Project(
    name: "DesignAppPreview",
    targets: [
        .target(
            name: "DesignAppPreview",
            destinations: .iOS,
            product: .app,
            bundleId: "com.ivfomenko.DesignAppPreview",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            dependencies: [.external(name: "iOSDesignSystemKit")],
            settings: .settings(
                base: [
                    "SWIFT_VERSION": "6.0",
                ],
                configurations: [],
                defaultSettings: .recommended
            )
        ),
    ]
)
