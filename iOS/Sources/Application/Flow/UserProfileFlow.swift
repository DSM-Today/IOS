import UIKit

import RxFlow

class UserProfileFlow: Flow {

    var root: Presentable {
        return rootViewController
    }

    private let rootViewController = AppDI.resolve().userProfileViewController

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }

        switch step {
        case .userProfileIsRequired:
            return navigateToUserProfileScene()
        case .tabsIsRequired:
            return navigateToTabsScreen()
        default:
            return .none
        }
    }
}

extension UserProfileFlow {
    private func navigateToUserProfileScene() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.viewModel
        ))
    }
    private func navigateToTabsScreen() -> FlowContributors {
        let tabsFlow = TabsFlow()

        Flows.use(tabsFlow, when: .created) { [weak self] root in
            root.modalPresentationStyle = .fullScreen
            root.modalTransitionStyle = .coverVertical
            self?.rootViewController.present(root, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: tabsFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.tabsIsRequired)
        ))
    }
}
