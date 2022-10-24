import UIKit

import SnapKit
import Then

class IdiomViewController: UIViewController {

    // MARK: - UI
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
    }
    private let firstIdiomLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.textAlignment = .center
        $0.backgroundColor = UIColor(red: 0.17, green: 0.41, blue: 0.76, alpha: 0.38)
        $0.layer.cornerRadius = 15
    }
    private let secondIdiomLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.textAlignment = .center
        $0.backgroundColor = UIColor(red: 0.17, green: 0.41, blue: 0.76, alpha: 0.38)
        $0.layer.cornerRadius = 15
    }
    private let thirdIdiomLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.textAlignment = .center
        $0.backgroundColor = UIColor(red: 0.17, green: 0.41, blue: 0.76, alpha: 0.38)
        $0.layer.cornerRadius = 15
    }
    private let fourthIdiomLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.textAlignment = .center
        $0.backgroundColor = UIColor(red: 0.17, green: 0.41, blue: 0.76, alpha: 0.38)
        $0.layer.cornerRadius = 15
    }
    private let chineseCharacterLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 32, family: .regular)
    }
    private let meanTextView = UITextView().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.textContainerInset = UIEdgeInsets(top: 13, left: 30, bottom: 13, right: 30)
        $0.layer.cornerRadius = 20
    }
    private let underView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let otherCategoryLabel = UILabel().then {
        $0.text = "다른 카테고리 보러가기"
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    private let categoryStackView = UIStackView().then {
        $0.axis = .horizontal
    }
    private let cafeCategoryView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
    }
    private let cafeCategoryLabel = UILabel().then {
        $0.text = "오늘의 카페메뉴"
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    private let quizCategoryView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
    }
    private let quizCategoryLabel = UILabel().then {
        $0.text = "오늘의 퀴즈"
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray1
        setDemoData()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setLayout()
        addSubviews()
        makeSubviewConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.meanTextView.isEditable = false
        setNavigation()
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.title = "오늘의 사자성어"
    }
    private func setLayout() {
        [firstIdiomLabel, secondIdiomLabel, thirdIdiomLabel, fourthIdiomLabel,
        meanTextView, underView, cafeCategoryView, quizCategoryView]
            .forEach { $0.clipsToBounds = true }
    }
    private func setDemoData() {
        firstIdiomLabel.text = "전"
        secondIdiomLabel.text = "화"
        thirdIdiomLabel.text = "위"
        fourthIdiomLabel.text = "복"
        chineseCharacterLabel.text = "轉禍爲福"
        meanTextView.text = "어떤 불행한 일이라도 끊임없는 노력과 강인한 의지로 힘쓰면 불행을 행복으로 바꾸어 놓을 수 있다는 말"
        cafeCategoryView.image = UIImage(systemName: "person.fill")
        cafeCategoryView.backgroundColor = .primary
        quizCategoryView.image = UIImage(systemName: "person.fill")
        quizCategoryView.backgroundColor = .primary
    }
}

// swiftlint:disable function_body_length
// MARK: - Layout
extension IdiomViewController {
    private func addSubviews() {
        [stackView, chineseCharacterLabel, meanTextView, underView]
            .forEach { view.addSubview($0) }
        [firstIdiomLabel, secondIdiomLabel, thirdIdiomLabel, fourthIdiomLabel]
            .forEach { stackView.addSubview($0) }
        [cafeCategoryView, quizCategoryView].forEach { categoryStackView.addSubview($0) }
        [otherCategoryLabel, categoryStackView].forEach { underView.addSubview($0) }
        cafeCategoryView.addSubview(cafeCategoryLabel)
        quizCategoryView.addSubview(quizCategoryLabel)
    }
    private func makeSubviewConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(89)
            $0.centerX.equalToSuperview()
        }
        firstIdiomLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(54)
        }
        secondIdiomLabel.snp.makeConstraints {
            $0.top.equalTo(firstIdiomLabel.snp.top)
            $0.leading.equalTo(firstIdiomLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(54)
        }
        thirdIdiomLabel.snp.makeConstraints {
            $0.top.equalTo(firstIdiomLabel.snp.top)
            $0.leading.equalTo(secondIdiomLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(54)
        }
        fourthIdiomLabel.snp.makeConstraints {
            $0.top.equalTo(firstIdiomLabel.snp.top)
            $0.leading.equalTo(thirdIdiomLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(54)
            $0.trailing.equalToSuperview()
        }
        chineseCharacterLabel.snp.makeConstraints {
            $0.top.equalTo(fourthIdiomLabel.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        meanTextView.snp.makeConstraints {
            $0.top.equalTo(chineseCharacterLabel.snp.bottom).offset(47)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(150)
        }
        underView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(260)
        }
        otherCategoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(23)
        }
        categoryStackView.snp.makeConstraints {
            $0.top.equalTo(otherCategoryLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        cafeCategoryView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(165)
        }
        cafeCategoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
        }
        quizCategoryView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(cafeCategoryView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(165)
        }
        quizCategoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
        }
    }
}
