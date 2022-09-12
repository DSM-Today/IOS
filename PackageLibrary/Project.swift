import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "PackageLibrary",
    platform: .iOS,
    infoplist: .default,
    dependencies: []
)
