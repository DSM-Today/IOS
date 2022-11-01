import UIKit

import SnapKit
import Then

class BookBottomSheetViewController: UIViewController {

    // MARK: - UI
    private let explainLabel = UILabel().then {
        $0.text = "설명"
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let contentTextView = UITextView().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setDemoData()
        self.contentTextView.isEditable = false
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setDemoData() {
        self.contentTextView.text = """
세계화의 종말, 갈등과 분열, 그리고 전쟁. 수십 년간 이어져
온 평화와 공존의 시대는 막을 내리고 엄청난 위기감 속에서
사람들은 다가올 미래를 두려워한다. 자산시장 및 증시의 버블붕괴는
마치 2008년 글로벌 경제위기의 데자뷔를 보는 듯하다. 제2의 외환위기 경고도 들려온다.
매우부정적인 전망이 압도하는 2023년을 목전에 두고 있는 지금,
소비 트렌드 전망에서 가장 중요한 것은 무엇이 반복되고 무엇이
달라질 것인가를 구별하는 작업일 것이다. 즉, ‘불황기의 소비 패턴’을
과거와 비교해보는 것이고, 또 하나는 ‘소비의 전형성’이 사라지는
시대의 흐름을 분석하는 것이다. 이른바 ‘평균 실종’이 가장 첫 번째
키워드인 이유다. 변화의 속도가 더욱 빨라지는 2023 대한민국.
소비자들은 어떤 선택을 할 것인가?
"""
    }
}

// MARK: - Layout
extension BookBottomSheetViewController {
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
