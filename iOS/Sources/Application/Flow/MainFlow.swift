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
        return .one(flowContributor: .contribute(
            withNextPresentable: rootViewController,
            withNextStepper: rootViewController.viewModel
        ))
    }
    private func navigateToRandomCategoryScene() -> FlowContributors {
        let randomFlow = RandomFlow()
        let randomViewController = app.randomCategoryViewController

        Flows.use(randomFlow, when: .created) { [weak self] _ in
            self?.rootViewController.pushViewController(randomViewController)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: randomFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.randomCategoryIsRequired)
        ))
    }
    private func navigateToInformationCategoryScene() -> FlowContributors {
        let informationFlow = InformationFlow()
        let informationViewController = app.informationCategoryViewController

        Flows.use(informationFlow, when: .created) { [weak self] _ in
            self?.rootViewController.pushViewController(informationViewController)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: informationFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.informationCategoryIsRequired)
        ))
    }
    private func navigateToRecommendCategoryScene() -> FlowContributors {
        let recommendFlow = RecommendFlow()
        let recommendViewController = app.recommendCategoryViewController

        Flows.use(recommendFlow, when: .created) { [weak self] _ in
            self?.rootViewController.pushViewController(recommendViewController)
        }

        return .one(flowContributor: .contribute(
            withNextPresentable: recommendFlow,
            withNextStepper: OneStepper(withSingleStep: TodayStep.recommendCategoryIsRequired)
        ))
    }
}
