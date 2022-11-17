import UIKit

import RxFlow

class InformationFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = app.informationCategoryViewController

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
        return .one(flowContributor: .contribute(
            withNextPresentable: self.rootViewController,
            withNextStepper: self.rootViewController.viewModel
        ))
    }
    private func navigateToNewsScene() -> FlowContributors {
        let newsViewController = app.newsViewController
        self.rootViewController.navigationController?.pushViewController(newsViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: newsViewController,
            withNextStepper: newsViewController.viewModel
        ))
    }
    private func navigateToLottoScene() -> FlowContributors {
        let lottoViewController = app.lottoViewController
        self.rootViewController.navigationController?.pushViewController(lottoViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: lottoViewController,
            withNextStepper: lottoViewController.viewModel
        ))
    }
}
