import Foundation

import UIKit

extension UIViewController {
    func alert(
        title: String,
        action: ((UIAlertAction
                 ) -> Void)?) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let  okay = UIAlertAction(
            title: "네", style: .default, handler: action
        )
        let cancel = UIAlertAction(
            title: "아니요", style: .destructive, handler: nil
        )
        [okay, cancel].forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
    }

    func okAlert(
        title: String,
        action: ((UIAlertAction) -> Void)?
    ) {
        let alert = UIAlertController(
            title: title, message: nil, preferredStyle: .alert
        )
        let okay = UIAlertAction(
            title: "확인", style: .default, handler: action
        )
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }
}
