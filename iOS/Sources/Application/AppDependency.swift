import Foundation

import Service

struct AppDependency {
    let onboardingViewController: OnboardingViewController
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let authDependency = AuthDependency.resolve()

        let onboardingViewModel = OnboardingViewModel(
            fetchClientIDUseCase: authDependency.fetchClientIDUseCase,
            googleLoginUseCase: authDependency.googleLoginUseCase
        )

        let onboardingViewController = OnboardingViewController().then {
            $0.viewModel = onboardingViewModel
        }

        return .init(onboardingViewController: onboardingViewController)
    }
}
