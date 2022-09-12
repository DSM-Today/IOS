import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.excutable(
    name: "Today-iOS",
    platform: .iOS,
    dependencies: [
        .project(target: "Service", path: "../Service")
    ]
)
