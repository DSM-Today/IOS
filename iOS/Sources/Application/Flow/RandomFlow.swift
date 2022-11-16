import UIKit

import RxFlow

class RandomFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = UINavigationController()

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
        let randomCategoryViewController = app.randomCategoryViewController
        self.rootViewController.pushViewController(randomCategoryViewController, animated: true)

        return .one(flowContributor: .contribute(
            withNextPresentable: randomCategoryViewController,
            withNextStepper: randomCategoryViewController.viewModel
        ))
    }
    private func navigateToFlowrScene() -> FlowContributors {
        let flowerViewController = app.flowerViewController
        self.rootViewController.pushViewController(flowerViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: flowerViewController))
    }
    private func navigateToIdiomScene() -> FlowContributors {
        let idiomViewController = app.idiomViewController
        self.rootViewController.pushViewController(idiomViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: idiomViewController))
    }
    private func navigateToLuckyScene() -> FlowContributors {
        let fortuneViewController = app.fortuneViewController
        self.rootViewController.pushViewController(fortuneViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: fortuneViewController))
    }
    private func navigateToQuizScene() -> FlowContributors {
        let quizViewController = app.quizViewController
        self.rootViewController.pushViewController(quizViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: quizViewController))
    }
    private func navigateToCharacterScene() -> FlowContributors {
        let characterViewController = app.characterViewController
        self.rootViewController.pushViewController(characterViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: characterViewController))
    }
}
