import UIKit

import SnapKit
import Then

class MyChatTableViewCell: UITableViewCell {

    // MARK: - UI
    let chatMessage = UITextView().then {
        $0.layer.cornerRadius = 15
        $0.isEditable = false
        $0.backgroundColor = .white
        $0.textContainerInset = UIEdgeInsets(top: 8, left: 11, bottom: 8, right: 11)
    }

    // MARK: - Layout
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        self.addSubview(chatMessage)

        chatMessage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.trailing.equalToSuperview().inset(10)
            $0.leading.greaterThanOrEqualToSuperview().offset(-200)
        }
    }
}
