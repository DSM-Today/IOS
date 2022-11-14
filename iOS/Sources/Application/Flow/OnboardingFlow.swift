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
        default:
            return .none
        }
    }
}

extension OnboardingFlow {
    private func navigateToOnboardingScreen() -> FlowContributors {
        return .one(flowContributor: .contribute(withNext: rootViewController))
    }
}
