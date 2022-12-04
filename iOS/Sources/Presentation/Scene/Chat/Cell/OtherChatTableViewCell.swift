import UIKit

import SnapKit
import Then

class OtherChatTableViewCell: UITableViewCell {

    // MARK: - UI
    let profileImage = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 18
    }
    let nameLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 10, family: .regular)
    }
    let chatMessage = UITextView().then {
        $0.layer.cornerRadius = 15
        $0.isEditable = false
        $0.backgroundColor = .white
        $0.textContainerInset = UIEdgeInsets(top: 8, left: 11, bottom: 8, right: 11)
    }
    let footerView = UIView()

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        makeSubviewConstraints()
        self.selectionStyle = .none
        self.backgroundColor = .gray1
    }
}

// MARK: - Layout
extension OtherChatTableViewCell {
    private func addSubviews() {
        [profileImage, nameLabel, chatMessage, footerView].forEach { self.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        profileImage.snp.makeConstraints {
            $0.width.height.equalTo(36)
            $0.leading.equalTo(16)
            $0.top.equalTo(1)
        }
        nameLabel.snp.makeConstraints {
            $0.bottom.equalTo(profileImage.snp.bottom)
            $0.leading.equalTo(profileImage.snp.trailing).offset(1)
        }
        chatMessage.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(1)
            $0.leading.equalTo(profileImage.snp.leading)
            $0.trailing.lessThanOrEqualToSuperview().inset(200)
        }
        footerView.snp.makeConstraints {
            $0.top.equalTo(chatMessage.snp.bottom)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }
}
