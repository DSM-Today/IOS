import UIKit

class ChatViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: ChatViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("채팅")
    }
}
