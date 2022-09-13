import ProjectDescription

extension TargetDependency {

    public struct SPM {
        
        public static let Moya = TargetDependency.external(name: "Moya")

        public static let SnapKit = TargetDependency.external(name: "SnapKit")
        public static let Then = TargetDependency.external(name: "Then")

        public static let RxSwift = TargetDependency.external(name: "RxSwift")
        public static let RxCocoa = TargetDependency.external(name: "RxCocoa")
        public static let RxMoya = TargetDependency.external(name: "RxMoya")

    }

}
