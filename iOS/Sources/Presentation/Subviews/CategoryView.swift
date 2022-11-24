import UIKit

import SnapKit
import Then

class CategoryView: UIView {

    // MARK: - Layout
    private let contentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    let categoryLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .notoSansFont(ofSize: 36, family: .medium)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }

    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
}

// MARK: - Layout
extension CategoryView {
    func addSubviews() {
        self.addSubview(contentView)
        contentView.addSubview(categoryLabel)
    }
    func makeSubviewConstraints() {
        contentView.snp.makeConstraints {
            $0.width.equalTo(160)
            $0.height.equalTo(200)
            $0.edges.equalToSuperview()
        }
        categoryLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
