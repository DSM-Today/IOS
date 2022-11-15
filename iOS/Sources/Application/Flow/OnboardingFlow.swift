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
    private func navigateToUserProfileScreen() -> FlowContributors {
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
            let navigationController = UINavigationController(rootViewController: root)
            let userProfileViewController = self?.app.userProfileViewController
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .coverVertical
            userProfileViewController?.present(navigationController, animated: true)
            self?.rootViewController.present(navigationController, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: mainFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.mainIsRequired)
        ))
    }
}
