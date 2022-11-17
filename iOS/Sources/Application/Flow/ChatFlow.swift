import UIKit

import RxFlow

class ChatFlow: Flow {

    private let app = AppDI.resolve()

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController = UINavigationController()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }
        switch step {
        case .chatISRequired:
            return navigateToChatScene()
        default:
            return .none
        }
    }
}

extension ChatFlow {
    private func navigateToChatScene() -> FlowContributors {
        let chatViewController = app.chatViewController
        self.rootViewController.pushViewController(chatViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: chatViewController,
            withNextStepper: chatViewController.viewModel
        ))
    }
}
