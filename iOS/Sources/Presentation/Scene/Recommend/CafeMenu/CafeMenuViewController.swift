import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class CafeMenuViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: CafeMenuViewModel!

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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        setDemoData()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 카페 메뉴")
        navigationController?.navigationBar.setBackButtonToArrow()
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
    }
}

// MARK: - Layout
extension CafeMenuViewController {
    private func addSubviews() {
        [todayDrinkLabel,
         drinkImage,
         cafeName,
         cafeMenuName
        ].forEach { view.addSubview($0) }
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
    }
}
