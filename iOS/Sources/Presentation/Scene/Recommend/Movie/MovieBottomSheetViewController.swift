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
        demoData()
        self.contentTextView.isEditable = false
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func demoData() {
        self.contentTextView.text = """
공조 이즈 백! 이번엔 삼각 공조다! 남한으로
 숨어든 글로벌 범죄 조직을 잡기 위해 새로운
공조 수사에 투입된 북한 형사 ‘림철령’(현빈).
 수사 중의 실수로 사이버수사대로 전출됐던 남한
 형사 ‘강진태’(유해진)는 광수대 복귀를 위해 모두가
 기피하는 ‘철령’의 파트너를 자청한다. 이렇게 다시
공조하게 된 ‘철령’과 ‘진태’! ‘철령’과 재회한
‘민영’(임윤아)의 마음도 불타오르는 가운데, ‘철령’과
 ‘진태’는 여전히 서로의 속내를 의심하면서도 나름
 그럴싸한 공조 수사를 펼친다. 드디어 범죄 조직
 리더인 ‘장명준’(진선규)의 은신처를 찾아내려는 찰나,
 미국에서 날아온 FBI 소속 ‘잭’(다니엘 헤니)이 그들
 앞에 나타나는데…! 아직도 짠내 나는 남한 형사, 여전한
 엘리트 북한 형사, 그리고 FBI 소속 해외파 형사까지!
 각자의 목적으로 뭉친 그들의 짜릿한 공조 수사가 시작된다!
"""
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
