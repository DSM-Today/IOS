import UIKit

extension UIViewController {
    func setNavigation(_ title: String) {
        view.backgroundColor = .gray1
        self.title = title
        if  let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.notoSansFont(ofSize: 20, family: .regular)
            ]
            appearance.shadowColor = .clear
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
}
