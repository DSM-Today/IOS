import UIKit

import RxFlow

class ProfileFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = UINavigationController()

    // swiftlint:disable cyclomatic_complexity
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }
        switch step {
        case .myPageIsRequired:
            return navigateToProfileScene()
        case .editProfileIsRequired:
            return navigateToEditProfileScene()
        case .newsIsRequired:
            return navigateToNewsScene()
        case .lottoIsRequired:
            return navigateToLottoScene()
        case .flowerIsRequired:
            return navigateToFlowrScene()
        case .idiomIsRequired:
            return navigateToIdiomScene()
        case .fortuneIsRequired:
            return navigateToLuckyScene()
        case .characterIsRequired:
            return navigateToCharacterScene()
        case .quizIsRequired:
            return navigateToQuizScene()
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
        case .moveToBackIsRequired:
            return navigateToBackScene()
        default:
            return .none
        }
    }
}

extension ProfileFlow {
    private func navigateToProfileScene() -> FlowContributors {
        let myPageViewController = app.myPageViewController
        self.rootViewController.pushViewController(myPageViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: myPageViewController,
            withNextStepper: myPageViewController.viewModel
        ))
    }
    private func navigateToEditProfileScene() -> FlowContributors {
        let editProfileViewController = app.editProfileViewController
        self.rootViewController.pushViewController(editProfileViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: editProfileViewController,
            withNextStepper: editProfileViewController.viewModel
        ))
    }
    private func navigateToNewsScene() -> FlowContributors {
        let newsViewController = app.newsViewController
        self.rootViewController.pushViewController(newsViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: newsViewController,
            withNextStepper: newsViewController.viewModel
        ))
    }
    private func navigateToLottoScene() -> FlowContributors {
        let lottoViewController = app.lottoViewController
        self.rootViewController.pushViewController(lottoViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: lottoViewController,
            withNextStepper: lottoViewController.viewModel
        ))
    }
    private func navigateToFlowrScene() -> FlowContributors {
        let flowerViewController = app.flowerViewController
        self.rootViewController.pushViewController(flowerViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: flowerViewController,
            withNextStepper: flowerViewController.viewModel
        ))
    }
    private func navigateToIdiomScene() -> FlowContributors {
        let idiomViewController = app.idiomViewController
        self.rootViewController.pushViewController(idiomViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: idiomViewController,
            withNextStepper: idiomViewController.viewModel
        ))
    }
    private func navigateToLuckyScene() -> FlowContributors {
        let fortuneViewController = app.fortuneViewController
        self.rootViewController.pushViewController(fortuneViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: fortuneViewController,
            withNextStepper: fortuneViewController.viewModel
        ))
    }
    private func navigateToQuizScene() -> FlowContributors {
        let quizViewController = app.quizViewController
        self.rootViewController.pushViewController(quizViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: quizViewController,
            withNextStepper: quizViewController.viewModel
        ))
    }
    private func navigateToCharacterScene() -> FlowContributors {
        let characterViewController = app.characterViewController
        self.rootViewController.pushViewController(characterViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: characterViewController,
            withNextStepper: characterViewController.viewModel
        ))
    }
    private func navigateToCafeMenuScene() -> FlowContributors {
        let cafeMenuViewController = app.cafeMenuViewController
        self.rootViewController.pushViewController(cafeMenuViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: cafeMenuViewController,
            withNextStepper: cafeMenuViewController.viewModel
        ))
    }
    private func navigateToMovieScene() -> FlowContributors {
        let movieViewController = app.movieViewController
        self.rootViewController.pushViewController(movieViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: movieViewController,
            withNextStepper: movieViewController.viewModel
        ))
    }
    private func navigateToMusicScene() -> FlowContributors {
        let musicViewController = app.musicViewController
        self.rootViewController.pushViewController(musicViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: musicViewController,
            withNextStepper: musicViewController.viewModel
        ))
    }
    private func navigateToWebtoonScene() -> FlowContributors {
        let webtoonViewController = app.webtoonViewController
        self.rootViewController.pushViewController(webtoonViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: webtoonViewController,
            withNextStepper: webtoonViewController.viewModel
        ))
    }
    private func navigateToFoodScene() -> FlowContributors {
        let foodViewController = app.foodViewController
        self.rootViewController.pushViewController(foodViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: foodViewController,
            withNextStepper: foodViewController.viewModel
        ))
    }
    private func navigateToBookScene() -> FlowContributors {
        let bookViewController = app.bookViewController
        self.rootViewController.pushViewController(bookViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: bookViewController,
            withNextStepper: bookViewController.viewModel
        ))
    }
    private func navigateToBackScene() -> FlowContributors {
        let myPageViewController = app.myPageViewController
        self.rootViewController.popViewController(animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: myPageViewController,
            withNextStepper: myPageViewController.viewModel
        ))
    }
}
