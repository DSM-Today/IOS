import UIKit

import SnapKit
import Then

class CafeMenuViewController: UIViewController {

    // MARK: - UI
    private let todayDrinkLabel = UILabel().then {
        $0.text = "오늘 뭐 마시지?"
        $0.font = .notoSansFont(ofSize: 22, family: .bold)
    }
    private let drinkImage = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private let cafeName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
    }
    private let cafeMenuName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let categoryBox = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let categoryTitle = UILabel().then {
        $0.text = "다른 카테고리 보러가기"
        $0.font = .notoSansFont(ofSize: 18, family: .medium)
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
        setNavigation()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.title = "오늘의 카페 메뉴"
        if  let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.shadowColor = .clear
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
    private func setDemoData() {
        self.drinkImage.image = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
        self.cafeName.text = "A Twosome Place"
        self.cafeName.textColor = .red1
        self.cafeMenuName.text = "스트로베리 초콜릿 라떼"
        self.otherCategoryImg.image = UIImage(systemName: "person.fill")
        self.otherCategoryTitle.text = "오늘의 인물"
        self.anotherCategoryImg.image = UIImage(systemName: "person.fill")
        self.anotherCategoryTitle.text = "오늘의 노래"
    }
}

// MARK: - Layout
extension CafeMenuViewController {
    private func addSubviews() {
        [todayDrinkLabel,
         drinkImage,
         cafeName,
         cafeMenuName,
         categoryBox,
         categoryTitle,
         otherCategoryImg,
         otherCategoryTitle,
         anotherCategoryImg,
         anotherCategoryTitle].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        todayDrinkLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(29)
            $0.centerX.equalToSuperview()
        }
        drinkImage.snp.makeConstraints {
            $0.top.equalTo(todayDrinkLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(230)
            $0.width.equalTo(180)
        }
        cafeName.snp.makeConstraints {
            $0.top.equalTo(drinkImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        cafeMenuName.snp.makeConstraints {
            $0.top.equalTo(cafeName.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
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
