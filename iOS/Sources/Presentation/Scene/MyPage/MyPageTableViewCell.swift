import UIKit

import SnapKit
import Then

class MyPageTableViewCell: UITableViewCell {

    // MARK: - UI
    static let identifier = "MyPageTableViewCell"

    let categorieTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 17, family: .regular)
    }
    let favoritesTitle = UILabel().then {
        $0.text = "즐겨찾기 한 사람 : "
        $0.font = .notoSansFont(ofSize: 8, family: .regular)
    }
    let favoriteCount = UILabel().then {
        $0.font = .notoSansFont(ofSize: 8, family: .regular)
    }

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.borderWidth = 0.5
        self.contentView.backgroundColor = .white
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 19, right: 0))
        addSubview()
        makeSubviewConstraints()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension MyPageTableViewCell {
    private func addSubview() {
        [categorieTitle, favoritesTitle, favoriteCount].forEach { self.contentView.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        categorieTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.centerX.equalToSuperview()
        }
        favoritesTitle.snp.makeConstraints {
            $0.top.equalTo(categorieTitle.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(208)
        }
        favoriteCount.snp.makeConstraints {
            $0.centerY.equalTo(favoritesTitle.snp.centerY)
            $0.leading.equalTo(favoritesTitle.snp.trailing)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}
