import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import RxFlow

class CharacterViewController: UIViewController, Stepper {

    var steps = PublishRelay<Step>()

    // MARK: - UI
    private let userProfileImg = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 41
    }
    private let userName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
    }
    private let userIntroduceText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 16, family: .medium)
        $0.textAlignment = .center
    }
    private let categoryTitle = UILabel().then {
        $0.text = "다른 카테고리 보러가기"
        $0.font = .notoSansFont(ofSize: 18, family: .medium)
    }
    private let categoryBox = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let otherCategoryImg = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let otherCategoryTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
    }
    private let anotherCategoryImg = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let anotherCategoryTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        setDemoData()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 인물")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setDemoData() {
        self.userProfileImg.image = UIImage(systemName: "bolt.fill")
        self.userName.text = "김기영"
        self.userIntroduceText.text = "THE MASTER OF  KIM  HERO\n심장을 공격하는 인천의 야수를 거느리는 남자"
        self.userIntroduceText.numberOfLines = 2
        self.otherCategoryImg.image = UIImage(systemName: "person.fill")
        self.otherCategoryTitle.text = "오늘의 인물"
        self.anotherCategoryImg.image = UIImage(systemName: "person.fill")
        self.anotherCategoryTitle.text = "오늘의 노래"
    }
}

// MARK: - Layout
extension CharacterViewController {
    private func addSubviews() {
        [userProfileImg,
         userName,
         userIntroduceText,
         categoryBox,
         categoryTitle,
         otherCategoryImg,
         otherCategoryTitle,
         anotherCategoryImg,
         anotherCategoryTitle].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        userProfileImg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(150)
            $0.width.equalTo(300)
            $0.height.equalTo(180)
        }
        userName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userProfileImg.snp.bottom).offset(40)
        }
        userIntroduceText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userName.snp.bottom).offset(6)
        }
        categoryBox.snp.makeConstraints {
            $0.height.equalTo(260)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        categoryTitle.snp.makeConstraints {
            $0.top.equalTo(categoryBox.snp.top).inset(21)
            $0.centerX.equalToSuperview()
        }
        otherCategoryImg.snp.makeConstraints {
            $0.top.equalTo(categoryTitle.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(165)
        }
        otherCategoryTitle.snp.makeConstraints {
            $0.top.equalTo(otherCategoryImg).inset(5)
            $0.leading.equalTo(otherCategoryImg.snp.leading).inset(33)
        }
        anotherCategoryImg.snp.makeConstraints {
            $0.centerY.equalTo(otherCategoryImg.snp.centerY)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.height.equalTo(165)
        }
        anotherCategoryTitle.snp.makeConstraints {
            $0.centerY.equalTo(otherCategoryTitle.snp.centerY)
            $0.trailing.equalToSuperview().inset(64)
        }
    }
}
