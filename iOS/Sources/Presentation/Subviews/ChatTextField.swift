import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class ChatTextField: UIView {

    let chatTextField = UITextField().then {
        $0.placeholder = "내용을 입력하세요."
        $0.font = .notoSansFont(ofSize: 18, family: .regular)
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.gray2.cgColor
        $0.addLeftPadding()
        $0.clipsToBounds = true
    }
    let sendButton = UIButton(type: .system).then {
        $0.setImage(.init(systemName: "paperplane"), for: .disabled)
        $0.setImage(.init(systemName: "paperplane.fill"), for: .normal)
        $0.setTitleColor(UIColor.primary, for: .normal)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
        addSubviews()
        makeSubviewConstraints()
    }

}

// MARK: - Layout
extension ChatTextField {
    private func addSubviews() {
        [chatTextField, sendButton].forEach { self.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        chatTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(11)
            $0.top.equalToSuperview().inset(6)
            $0.height.equalTo(45)
        }
        sendButton.snp.makeConstraints {
            $0.centerY.equalTo(chatTextField)
            $0.trailing.equalToSuperview().inset(18)
            $0.leading.equalTo(chatTextField.snp.trailing).offset(18)
            $0.width.height.equalTo(24)
        }
    }
}
