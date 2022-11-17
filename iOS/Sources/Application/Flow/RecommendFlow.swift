import UIKit

import RxFlow

class RecommendFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = app.recommendCategoryViewController

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
        return .one(flowContributor: .contribute(
            withNextPresentable: self.rootViewController,
            withNextStepper: self.rootViewController.viewModel
        ))
    }
    private func navigateToCafeMenuScene() -> FlowContributors {
        let cafeMenuViewController = app.cafeMenuViewController
        self.rootViewController.navigationController?.pushViewController(cafeMenuViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: cafeMenuViewController,
            withNextStepper: cafeMenuViewController.viewModel
        ))
    }
    private func navigateToMovieScene() -> FlowContributors {
        let movieViewController = app.movieViewController
        self.rootViewController.navigationController?.pushViewController(movieViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: movieViewController,
            withNextStepper: movieViewController.viewModel
        ))
    }
    private func navigateToMusicScene() -> FlowContributors {
        let musicViewController = app.musicViewController
        self.rootViewController.navigationController?.pushViewController(musicViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: musicViewController,
            withNextStepper: musicViewController.viewModel
        ))
    }
    private func navigateToWebtoonScene() -> FlowContributors {
        let webtoonViewController = app.webtoonViewController
        self.rootViewController.navigationController?.pushViewController(webtoonViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: webtoonViewController,
            withNextStepper: webtoonViewController.viewModel
        ))
    }
    private func navigateToFoodScene() -> FlowContributors {
        let foodViewController = app.foodViewController
        self.rootViewController.navigationController?.pushViewController(foodViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: foodViewController,
            withNextStepper: foodViewController.viewModel
        ))
    }
    private func navigateToBookScene() -> FlowContributors {
        let bookViewController = app.bookViewController
        self.rootViewController.navigationController?.pushViewController(bookViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: bookViewController,
            withNextStepper: bookViewController.viewModel
        ))
    }
}
