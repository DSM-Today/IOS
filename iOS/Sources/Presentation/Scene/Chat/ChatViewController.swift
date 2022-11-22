import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class ChatViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: ChatViewModel!

    private var disposeBag = DisposeBag()

    // MARK: - UI
    private let inputBar = ChatTextField()
    private let backButton = UIBarButtonItem(
        image: .init(systemName: "arrow.backward"),
        style: .plain,
        target: ChatViewController.self,
        action: nil
    )

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setTextField()
        setKeyBoard()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("채팅")
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.leftBarButtonItem = backButton
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    // MARK: - Set
    private func setButton() {
        backButton.rx.tap
            .subscribe(onNext: {
                self.tabBarController?.selectedIndex = 1
            })
            .disposed(by: disposeBag)
    }
    private func setTextField() {
        inputBar.chatTextField.rx.text.orEmpty
            .map { $0.count != 0 }
            .bind(to: inputBar.sendButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    private func setKeyBoard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillAppear(note:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillDisappear(note:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // MARK: - Keyboard
    @objc func keyboardWillAppear(note: Notification) {
        if let keyboardSize = (note.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.origin.y = inputBar.chatTextField.frame.height - keyboardSize.height - 20
        }
    }
    @objc func keyboardWillDisappear(note: Notification) {
        view.frame.origin.y = 0
    }
}

// MARK: - Layout
extension ChatViewController {
    private func addSubviews() {
        [inputBar].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        inputBar.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
}
