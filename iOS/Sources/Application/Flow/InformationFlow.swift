import UIKit

import RxFlow

class InformationFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = UINavigationController()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }
        switch step {
        case .informationCategoryIsRequired:
            return navigateToInformationCategoryScene()
        case .newsIsRequired:
            return navigateToNewsScene()
        case .lottoIsRequired:
            return navigateToLottoScene()
        default:
            return .none
        }
    }
}

extension InformationFlow {
    private func navigateToInformationCategoryScene() -> FlowContributors {
        let informationCetrgoryViewController = app.informationCategoryViewController
        self.rootViewController.pushViewController(informationCetrgoryViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: informationCetrgoryViewController,
            withNextStepper: informationCetrgoryViewController.viewModel
        ))
    }
    private func navigateToNewsScene() -> FlowContributors {
        let newsViewController = app.newsViewController
        self.rootViewController.pushViewController(newsViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: newsViewController))
    }
    private func navigateToLottoScene() -> FlowContributors {
        let lottoViewController = app.lottoViewController
        self.rootViewController.pushViewController(lottoViewController, animated: true)
        return .one(flowContributor: .contribute(withNext: lottoViewController))
    }
}
