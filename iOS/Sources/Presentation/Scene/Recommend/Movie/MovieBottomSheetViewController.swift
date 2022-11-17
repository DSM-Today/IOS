import UIKit

import SnapKit
import Then

class MovieBottomSheetViewController: UIViewController {

    // MARK: - UI
    private let explainLabel = UILabel().then {
        $0.text = "설명"
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    let contentTextView = UITextView().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.contentTextView.isEditable = false
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
}

// MARK: - Layout
extension MovieBottomSheetViewController {
    private func addSubviews() {
        [explainLabel, contentTextView].forEach { view.addSubview($0) }
    }

    private func makeSubviewConstraints() {
        explainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
        }
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}
