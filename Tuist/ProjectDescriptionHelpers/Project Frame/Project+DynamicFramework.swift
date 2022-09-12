import ProjectDescription

extension Project {

    public static func dynamicFramework(
        name: String,
        platform: Platform,
        infoplist: InfoPlist,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            organizationName: todayOrganizationName,
            settings: nil,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .framework,
                    bundleId: "\(todayOrganizationName).\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: .iphone
                    ),
                    infoPlist: infoplist,
                    sources: ["Sources/**"],
                    scripts: [.swiftlint],
                    dependencies: dependencies
                )
            ]
        )
    }
}
