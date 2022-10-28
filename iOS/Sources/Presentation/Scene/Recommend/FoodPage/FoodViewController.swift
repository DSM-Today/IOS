import UIKit

import SnapKit
import Then

class FoodViewController: UIViewController {

    // MARK: - UI
    private let todayEatLabel = UILabel().then {
        $0.text = "오늘 뭐 먹지?"
        $0.font = .notoSansFont(ofSize: 22, family: .bold)
    }
    private let foodImage = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private let foodName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let categoryView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let goToOtherCategoryLabel = UILabel().then {
        $0.text = "다른 카테고리 보러가기"
        $0.font = .notoSansFont(ofSize: 18, family: .medium)
    }
    private let cafeMenuCategoryImage = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let cafeMenuCategoryLabel = UILabel().then {
        $0.text = "오늘의 카페메뉴"
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
    }
    private let movieCategoryImage = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let movieCategoryLabel = UILabel().then {
        $0.text = "오늘의 영화"
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDemoData()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 음식")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setDemoData() {
        self.foodImage.backgroundColor = .black
        self.foodImage.image = UIImage(systemName: "square.fill")
        self.foodName.text = "감자전"
        self.cafeMenuCategoryImage.image = UIImage(systemName: "square.fill")
        self.movieCategoryImage.image = UIImage(systemName: "square.fill")
    }
}

// MARK: - Layout
extension FoodViewController {
    private func addSubviews() {
        [todayEatLabel,
         foodImage,
         foodName,
         categoryView,
         goToOtherCategoryLabel,
         cafeMenuCategoryImage,
         cafeMenuCategoryLabel,
         movieCategoryImage,
         movieCategoryLabel].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        todayEatLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(29)
            $0.centerX.equalToSuperview()
        }
        foodImage.snp.makeConstraints {
            $0.top.equalTo(todayEatLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(200)
        }
        foodName.snp.makeConstraints {
            $0.top.equalTo(foodImage.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
        }
        categoryView.snp.makeConstraints {
            $0.height.equalTo(260)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        goToOtherCategoryLabel.snp.makeConstraints {
            $0.top.equalTo(categoryView.snp.top).inset(21)
            $0.centerX.equalToSuperview()
        }
        cafeMenuCategoryImage.snp.makeConstraints {
            $0.top.equalTo(goToOtherCategoryLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(30)
            $0.width.height.equalTo(165)
        }
        cafeMenuCategoryLabel.snp.makeConstraints {
            $0.top.equalTo(cafeMenuCategoryImage).inset(5)
            $0.centerX.equalTo(cafeMenuCategoryImage)
        }
        movieCategoryImage.snp.makeConstraints {
            $0.top.equalTo(goToOtherCategoryLabel.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.height.equalTo(165)
        }
        movieCategoryLabel.snp.makeConstraints {
            $0.centerY.equalTo(cafeMenuCategoryLabel.snp.centerY)
            $0.centerX.equalTo(movieCategoryImage)
        }
    }
}
