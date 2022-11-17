import UIKit

import RxFlow

class ProfileFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = UINavigationController()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }
        switch step {
        case .myPageIsRequired:
            return navigateToProfileScene()
        default:
            return .none
        }
    }
}

extension ProfileFlow {
    private func navigateToProfileScene() -> FlowContributors {
        let myPageViewController = app.myPageViewController
        self.rootViewController.pushViewController(myPageViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: myPageViewController,
            withNextStepper: myPageViewController.viewModel
        ))
    }
}
