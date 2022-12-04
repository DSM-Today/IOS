import UIKit

import SnapKit
import Then

class MainToDoTableViewCell: UITableViewCell {

    // MARK: - Life Cycle
    let toDoLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 17, family: .regular)
    }

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
        self.backgroundColor = .gray1
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 5
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 0.1
        self.contentView.layer.shadowOffset = .init(width: 0, height: 5)
        self.selectionStyle = .none
    }
}

extension MainToDoTableViewCell {
    private func addSubviews() {
        self.contentView.addSubview(toDoLabel)

        toDoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
