import UIKit

import RxFlow

class MainFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = UINavigationController()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }
        switch step {
        case .mainIsRequired:
            return moveToMainScreen()
        default:
            return .none
        }
    }
}

extension MainFlow {
    private func moveToMainScreen() -> FlowContributors {
        let mainViewController = app.mainViewController
        rootViewController.pushViewController(mainViewController, animated: true)

        return .one(flowContributor: .contribute(
            withNextPresentable: mainViewController,
            withNextStepper: mainViewController.viewModel
        ))
    }
}
