import UIKit

import SnapKit
import Then

class FortuneViewController: UIViewController {

    // MARK: - UI
    private let fortuneImg = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 50
    }
    private let fortuneName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 24, family: .bold)
    }
    private let birthDeadline = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let explainBox = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let explainTextView = UITextView().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        setDemoData()
        self.explainTextView.isEditable = false
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 운세")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setDemoData() {
        self.fortuneImg.image = UIImage(systemName: "person.fill")
        self.fortuneName.text = "사람자리"
        self.birthDeadline.text = "01.01 ~ 12.31"
        self.explainTextView.text = """
    순조로운 하루가 예상됩니다. 들리면 반가
    운 소식이요, 가는 곳마다 잔치이고, 하는
    일마다 막힘이 없습니다. 다만, 즐겁고
    기쁜 일이 끊이지 않으니 오히려 일상을
    소홀히 할 수도 있겠습니다. 어쨌던
    오랜만에 마음이 넉넉한 하루가 될 것입니
    다. 이제까지 어려운 시기를 지나오느라
    수고하셨으며 주변은 내내 넘치는 활기로
    떠들썩하겠습니다. 연인은 프로포즈하기
    좋은 날이며 물 관련 종사자는 더 없이
    잘 풀리는 하루가 되겠습니다.
    """
    }
}

// MARK: - Layout
extension FortuneViewController {
    private func addSubviews() {
        [fortuneImg,
         fortuneName,
         birthDeadline,
         explainBox,
         explainTextView].forEach { view.addSubview($0)}
    }
    private func makeSubviewConstraints() {
        fortuneImg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(140)
            $0.width.height.equalTo(185)
        }
        fortuneName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fortuneImg.snp.bottom).offset(30)
        }
        birthDeadline.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fortuneName.snp.bottom).offset(10)
        }
        explainBox.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        explainTextView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(340)
        }
    }
}
