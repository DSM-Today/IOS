import UIKit

import RxFlow

class RecommendFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = UINavigationController()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }
        switch step {
        case .recommendCategoryIsRequired:
            return navigateToRecommendScene()
        case .cafemenuIsRequired:
            return navigateToCafeMenuScene()
        case .movieIsRequired:
            return navigateToMovieScene()
        case .musicIsRequired:
            return navigateToMusicScene()
        case .webtoonIsRequired:
            return navigateToWebtoonScene()
        case .foodIsRequired:
            return navigateToFoodScene()
        case .bookIsRequired:
            return navigateToBookScene()
        default:
            return .none
        }
    }

}

extension RecommendFlow {
    private func navigateToRecommendScene() -> FlowContributors {
        let recommendCategoryViewController = app.recommendCategoryViewController
        self.rootViewController.pushViewController(recommendCategoryViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: recommendCategoryViewController,
            withNextStepper: recommendCategoryViewController.viewModel
        ))
    }
    private func navigateToCafeMenuScene() -> FlowContributors {
        let cafeMenuViewController = app.cafeMenuViewController
        self.rootViewController.pushViewController(cafeMenuViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: cafeMenuViewController))
    }
    private func navigateToMovieScene() -> FlowContributors {
        let movieViewController = app.movieViewController
        self.rootViewController.pushViewController(movieViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: movieViewController))
    }
    private func navigateToMusicScene() -> FlowContributors {
        let musicViewController = app.musicViewController
        self.rootViewController.pushViewController(musicViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: musicViewController))
    }
    private func navigateToWebtoonScene() -> FlowContributors {
        let webtoonViewController = app.webtoonViewController
        self.rootViewController.pushViewController(webtoonViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: webtoonViewController))
    }
    private func navigateToFoodScene() -> FlowContributors {
        let foodViewController = app.foodViewController
        self.rootViewController.pushViewController(foodViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: foodViewController))
    }
    private func navigateToBookScene() -> FlowContributors {
        let bookViewController = app.bookViewController
        self.rootViewController.pushViewController(bookViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: bookViewController))
    }
}
