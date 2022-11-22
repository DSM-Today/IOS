import UIKit

import RxFlow

class OnboardingFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = app.onboardingViewController

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }
        switch step {
        case .onboarindIsRequired:
            return navigateToOnboardingScreen()
        case .userProfileIsRequired:
            return navigateToUserProfileScreen()
        case .tabsIsRequired:
            return navigateToTabsScreen()
        default:
            return .none
        }
    }
}

extension OnboardingFlow {
    private func navigateToOnboardingScreen() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.viewModel
        ))
    }
    private func navigateToUserProfileScreen() -> FlowContributors {
        let userProfileFlow = UserProfileFlow()

        Flows.use(userProfileFlow, when: .created) { [weak self] root in
            root.modalPresentationStyle = .fullScreen
            root.modalTransitionStyle = .coverVertical
            self?.rootViewController.present(root, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: userProfileFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.userProfileIsRequired)
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
