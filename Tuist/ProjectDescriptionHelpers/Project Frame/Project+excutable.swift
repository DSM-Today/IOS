import ProjectDescription

extension Project {

    public static func excutable(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            organizationName: todayOrganizationName,
            settings: nil,
            targets: [
                Target(
                    name: name,
                    platform: platform
                    ,
                    product: .app,
                    bundleId: "\(todayOrganizationName).\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: .iphone
                    ),
                    infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    dependencies: dependencies
                    )
            ]
        )
    }
}
