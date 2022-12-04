import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import Service

class ChatViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: ChatViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()
    private let leaveRoom = PublishRelay<Void>()

    // MARK: - UI
    private let inputBar = ChatTextField()
    private let chatTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(MyChatTableViewCell.self, forCellReuseIdentifier: "myCell")
        $0.register(OtherChatTableViewCell.self, forCellReuseIdentifier: "otherCell")
    }
    private let backButton = UIBarButtonItem(
        image: .init(systemName: "arrow.backward"),
        style: .plain,
        target: ChatViewController.self,
        action: nil
    )

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setButton()
        setTextField()
        setKeyBoard()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("채팅")
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.leftBarButtonItem = backButton
        viewAppear.accept(())
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        leaveRoom.accept(())
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    // MARK: - Bind
    private func bind() {
        let input = ChatViewModel.Input(
            viewAppear: viewAppear.asDriver(onErrorJustReturn: ()),
            message: inputBar.chatTextField.rx.text.orEmpty.asDriver(),
            sendMessage: inputBar.sendButton.rx.tap.asDriver(),
            leaveRoom: leaveRoom.asDriver(onErrorJustReturn: ())
        )

        let output = viewModel.transform(input)

        // swiftlint:disable line_length
        output.chatList.bind(to: chatTableView.rx.items) { _, _, item -> UITableViewCell in
            if output.myName == item.sender {
                let cell = self.chatTableView.dequeueReusableCell(withIdentifier: "myCell") as? MyChatTableViewCell
                cell?.chatMessage.text = item.content
                return cell ?? UITableViewCell()
            } else {
                let cell = self.chatTableView.dequeueReusableCell(withIdentifier: "otherCell") as? OtherChatTableViewCell
                cell?.chatMessage.text = item.content
                cell?.nameLabel.text = item.sender
                cell?.profileImage.kf.setImage(with: item.imageUrl)
                return cell ?? UITableViewCell()
            }
        }
        .disposed(by: disposeBag)
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
            view.frame.origin.y = inputBar.chatTextField.frame.height - keyboardSize.height - 10
        }
    }
    @objc func keyboardWillDisappear(note: Notification) {
        view.frame.origin.y = 0
    }
}

// MARK: - Layout
extension ChatViewController {
    private func addSubviews() {
        [chatTableView, inputBar].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        chatTableView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(inputBar.snp.top)
        }
        inputBar.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
}
