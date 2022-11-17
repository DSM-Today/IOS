import UIKit

import RxFlow

class TabsFlow: Flow {

    var root: Presentable {
        return rootViewController
    }

    private let rootViewController = UITabBarController()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TodayStep else { return .none }

        switch step {
        case .tabsIsRequired:
            return navigateToTabsScreen()
        default:
            return .none
        }
    }

    private func navigateToTabsScreen() -> FlowContributors {

        let chatFlow = ChatFlow()
        let mainFlow = MainFlow()
        let profileFlow = ProfileFlow()

        Flows.use(
            chatFlow, mainFlow, profileFlow,
            when: .created
        ) { [weak self] root1, root2, root3 in
            let tabBarItem1 = UITabBarItem(
                title: "채팅",
                image: UIImage(systemName: "message"),
                selectedImage: UIImage(systemName: "message.fill")
            )
            let tabBarItem2 = UITabBarItem(
                title: "오늘의 카테고리",
                image: UIImage(systemName: "house"),
                selectedImage: UIImage(systemName: "house.fill")
            )
            let tabBarItem3 = UITabBarItem(
                title: "마이페이지",
                image: UIImage(systemName: "person"),
                selectedImage: UIImage(systemName: "person.fill")
            )

            root1.tabBarItem = tabBarItem1
            root2.tabBarItem = tabBarItem2
            root3.tabBarItem = tabBarItem3

            self?.rootViewController.tabBar.tintColor = .primary
            self?.rootViewController.tabBar.backgroundColor = .white
            self?.rootViewController.setViewControllers([root1, root2, root3], animated: false)
            self?.rootViewController.selectedIndex = 1
        }

        return .multiple(flowContributors: [
            .contribute(
                withNextPresentable: chatFlow,
                withNextStepper: OneStepper(withSingleStep: TodayStep.chatISRequired)
            ),
            .contribute(
                withNextPresentable: mainFlow,
                withNextStepper: OneStepper(withSingleStep: TodayStep.mainIsRequired)
            ),
            .contribute(
                withNextPresentable: profileFlow,
                withNextStepper: OneStepper(withSingleStep: TodayStep.myPageIsRequired)
            )
        ])
    }

}
