import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.excutable(
    name: "Today",
    platform: .iOS,
    dependencies: [
        .project(target: "Service", path: "../Service"),
        .project(target: "PackageLibrary", path: "../PackageLibrary")
    ]
)
