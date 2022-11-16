import Foundation

import UIKit
import RxFlow

class AppFlow: Flow {

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController: UIViewController = {
        let launchScreenStoryBoard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let launchScreen = launchScreenStoryBoard.instantiateViewController(withIdentifier: "LaunchScreen")
        return launchScreen
    }()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }

        switch step {
        case .onboarindIsRequired:
            return navigateToOnboardinScreen()
        case .mainIsRequired:
            return navigateToMainScene()
        default:
            return .none
        }
    }
}

extension AppFlow {

    private func navigateToOnboardinScreen() -> FlowContributors {
        let onboardingFlow = OnboardingFlow()
        Flows.use(onboardingFlow, when: .created) { [weak self] root in
            root.modalPresentationStyle = .fullScreen
            self?.rootViewController.present(root, animated: true)
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: onboardingFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.onboarindIsRequired))
        )
    }
    private func navigateToMainScene() -> FlowContributors {
        let mainFlow = MainFlow()

        Flows.use(mainFlow, when: .created) { [weak self] root in
            let navigationController = UINavigationController(rootViewController: root)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .coverVertical
            self?.rootViewController.present(navigationController, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: mainFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.mainIsRequired)
        ))
    }
}
