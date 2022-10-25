import UIKit

import SnapKit
import Then

class CategoryTableViewCell: UITableViewCell {

    // MARK: - UI
    static let identifier = "CategoryTableViewCell"

    let categoryLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 15, family: .regular)
        $0.text = "오늘의 꽃"
    }
    let lineView = UIView().then {
        $0.backgroundColor = .gray3
    }
    let bookMarkTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 8, family: .regular)
        $0.textColor = .gray2
    }
    let bookMarkButton = UIButton().then {
        $0.setTitle("즐겨찾기", for: .normal)
        $0.setTitleColor(.blue9, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 8, family: .regular)
        $0.backgroundColor = .blue8
        $0.layer.cornerRadius = 8
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview()
        makeSubviewConstraints()
        self.contentView.layer.cornerRadius = 5
        self.contentView.backgroundColor = .white
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(top: 0, left: 0, bottom: 19, right: 0)
        )
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 0.1
        self.contentView.layer.shadowRadius = 10
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// MARK: - Layout
extension CategoryTableViewCell {
    private func addSubview() {
        [categoryLabel,
         lineView,
         bookMarkTitle,
         bookMarkButton
        ].forEach { self.contentView.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(9.87)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        bookMarkTitle.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(12.36)
            $0.leading.equalToSuperview().inset(20)
        }
        bookMarkButton.snp.makeConstraints {
            $0.top.equalTo(bookMarkTitle.snp.top)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(15)
            $0.width.equalTo(60)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
}
