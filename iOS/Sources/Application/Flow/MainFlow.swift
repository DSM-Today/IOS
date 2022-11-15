import UIKit

import RxFlow

class MainFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = app.mainViewController

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
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.viewModel
        ))
    }
}
