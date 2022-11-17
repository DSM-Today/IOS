import UIKit

import RxFlow

class RandomFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = app.randomCategoryViewController

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }
        switch step {
        case .randomCategoryIsRequired:
            return navigateToRandomCategoryScene()
        case .flowerIsRequired:
            return navigateToFlowrScene()
        case .idiomIsRequired:
            return navigateToIdiomScene()
        case .fortuneIsRequired:
            return navigateToLuckyScene()
        case .quizIsRequired:
            return navigateToQuizScene()
        case .characterIsRequired:
            return navigateToCharacterScene()
        default:
            return .none
        }
    }
}

extension RandomFlow {
    private func navigateToRandomCategoryScene() -> FlowContributors {
        return .one(flowContributor: .contribute(
            withNextPresentable: self.rootViewController,
            withNextStepper: self.rootViewController.viewModel
        ))
    }
    private func navigateToFlowrScene() -> FlowContributors {
        let flowerViewController = app.flowerViewController
        self.rootViewController.navigationController?.pushViewController(flowerViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: flowerViewController,
            withNextStepper: flowerViewController.viewModel
        ))
    }
    private func navigateToIdiomScene() -> FlowContributors {
        let idiomViewController = app.idiomViewController
        self.rootViewController.navigationController?.pushViewController(idiomViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: idiomViewController,
            withNextStepper: idiomViewController.viewModel
        ))
    }
    private func navigateToLuckyScene() -> FlowContributors {
        let fortuneViewController = app.fortuneViewController
        self.rootViewController.navigationController?.pushViewController(fortuneViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: fortuneViewController,
            withNextStepper: fortuneViewController.viewModel
        ))
    }
    private func navigateToQuizScene() -> FlowContributors {
        let quizViewController = app.quizViewController
        self.rootViewController.navigationController?.pushViewController(quizViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: quizViewController,
            withNextStepper: quizViewController.viewModel
        ))
    }
    private func navigateToCharacterScene() -> FlowContributors {
        let characterViewController = app.characterViewController
        self.rootViewController.navigationController?.pushViewController(characterViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: characterViewController,
            withNextStepper: characterViewController.viewModel
        ))
    }
}
