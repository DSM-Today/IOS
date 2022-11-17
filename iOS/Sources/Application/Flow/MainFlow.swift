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
            return navigateToMainScreen()
        case .randomCategoryIsRequired:
            return navigateToRandomCategoryScene()
        case .informationCategoryIsRequired:
            return navigateToInformationCategoryScene()
        case .recommendCategoryIsRequired:
            return navigateToRecommendCategoryScene()
        default:
            return .none
        }
    }
}

extension MainFlow {
    private func navigateToMainScreen() -> FlowContributors {
        let mainViewController = app.mainViewController
        self.rootViewController.pushViewController(mainViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: mainViewController,
            withNextStepper: mainViewController.viewModel
        ))
    }
    private func navigateToRandomCategoryScene() -> FlowContributors {
        let randomFlow = RandomFlow()

        Flows.use(randomFlow, when: .created) { [weak self] root in
            self?.rootViewController.pushViewController(root, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: randomFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.randomCategoryIsRequired)
        ))
    }
    private func navigateToInformationCategoryScene() -> FlowContributors {
        let informationFlow = InformationFlow()

        Flows.use(informationFlow, when: .created) { [weak self] root in
            self?.rootViewController.pushViewController(root, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: informationFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.informationCategoryIsRequired)
        ))
    }
    private func navigateToRecommendCategoryScene() -> FlowContributors {
        let recommendFlow = RecommendFlow()

        Flows.use(recommendFlow, when: .created) { [weak self] root in
            self?.rootViewController.pushViewController(root, animated: true)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: recommendFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.recommendCategoryIsRequired)
        ))
    }
}
