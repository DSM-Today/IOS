import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class FoodViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: FoodViewModel!

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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDemoData()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 음식")
        navigationController?.navigationBar.setBackButtonToArrow()
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
    }
}

// MARK: - Layout
extension FoodViewController {
    private func addSubviews() {
        [todayEatLabel,
         foodImage,
         foodName
        ].forEach { view.addSubview($0) }
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
    }
}
