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
            return navigateToUserProeileScreen()
        case .mainIsRequired:
            return navigateToMainScreen()
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
    private func navigateToUserProeileScreen() -> FlowContributors {
        let userProfileViewController = app.userProfileViewController
        let navigationUserProfileViewController = UINavigationController(rootViewController: userProfileViewController)
        navigationUserProfileViewController.modalPresentationStyle = .fullScreen
        navigationUserProfileViewController.modalTransitionStyle = .coverVertical
        self.rootViewController.present(
            navigationUserProfileViewController,
            animated: true
        )
        return .one(flowContributor: .contribute(
            withNextPresentable: userProfileViewController,
            withNextStepper: userProfileViewController.viewModel
        ))
    }
    private func navigateToMainScreen() -> FlowContributors {
        let mainFlow = MainFlow()

        Flows.use(mainFlow, when: .created) { [weak self] root in
            root.modalPresentationStyle = .fullScreen
            root.modalTransitionStyle = .coverVertical
            self?.rootViewController.present(root, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: mainFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.mainIsRequired)
        ))
    }
}
