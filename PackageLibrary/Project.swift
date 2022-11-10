import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "PackageLibrary",
    packages: [
        .GoogleSignIn
    ],
    platform: .iOS,
    dependencies: [
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.RxMoya,
        .SPM.Moya,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.KeychainSwift,
        .SPM.GoogleSignIn
    ]
)
