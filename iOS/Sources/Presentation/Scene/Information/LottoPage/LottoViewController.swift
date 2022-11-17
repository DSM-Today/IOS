import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class LottoViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: LottoViewModel!

    // MARK: - UI
    private let todayEatLabel = UILabel().then {
        $0.text = "이번 주 로또 번호는?"
        $0.font = .notoSansFont(ofSize: 22, family: .bold)
    }
    private let lottoView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = .init(width: 0, height: 5)
        $0.layer.shadowOpacity = 0.1
        $0.layer.cornerRadius = 41
    }
    private let lottoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.backgroundColor = .white
    }
    private let categoryView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let goToOtherCategoryLabel = UILabel().then {
        $0.text = "오늘의 뉴스 보러가기"
        $0.font = .notoSansFont(ofSize: 18, family: .medium)
    }
    private let cafeMenuCategoryImage = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let plusView = UIImageView().then {
        $0.image = UIImage(systemName: "plus")
        $0.tintColor = .black
    }
    private let numberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 22, family: .medium)
    }
    private let dateLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    private let moneyLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
        $0.textColor = .primary
    }
    private let firstNumberLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.red1.cgColor
        $0.layer.cornerRadius = 17
    }
    private let secondNumberLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.orange1.cgColor
        $0.layer.cornerRadius = 17
    }
    private let thirdNumberLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.yellow1.cgColor
        $0.layer.cornerRadius = 17
    }
    private let fourthNumberLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.blue7.cgColor
        $0.layer.cornerRadius = 17
    }
    private let fifthNumberLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.purple1.cgColor
        $0.layer.cornerRadius = 17
    }
    private let sixthNumberLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.gray2.cgColor
        $0.layer.cornerRadius = 17
    }
    private let seventhNumberLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.blue6.cgColor
        $0.layer.cornerRadius = 17
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDemoData()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("로또")
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setDemoData() {
        self.cafeMenuCategoryImage.image = UIImage(systemName: "square.fill")
        numberLabel.text = "1038회차"
        dateLabel.text = "2022.10.22"
        moneyLabel.text = "2,868,856,209원"
        firstNumberLabel.text = "26"
        secondNumberLabel.text = "26"
        thirdNumberLabel.text = "26"
        fourthNumberLabel.text = "26"
        fifthNumberLabel.text = "26"
        sixthNumberLabel.text = "26"
        seventhNumberLabel.text = "26"
    }
}

// MARK: - Layout
extension LottoViewController {
    private func addSubviews() {
        [todayEatLabel,
         lottoView,
         categoryView,
         goToOtherCategoryLabel,
         cafeMenuCategoryImage,
         moneyLabel
        ].forEach { view.addSubview($0) }

        [plusView,
         firstNumberLabel,
         secondNumberLabel,
         thirdNumberLabel,
         fourthNumberLabel,
         fifthNumberLabel,
         sixthNumberLabel,
         seventhNumberLabel
        ].forEach { lottoStackView.addSubview($0) }

        [lottoStackView, numberLabel, dateLabel].forEach { lottoView.addSubview($0) }
    }
    // swiftlint:disable function_body_length
    private func makeSubviewConstraints() {
        todayEatLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(29)
            $0.centerX.equalToSuperview()
        }
        lottoView.snp.makeConstraints {
            $0.top.equalTo(todayEatLabel.snp.bottom).offset(38)
            $0.leading.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(260)
        }
        lottoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(34)
        }
        categoryView.snp.makeConstraints {
            $0.height.equalTo(150)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        cafeMenuCategoryImage.snp.makeConstraints {
            $0.centerY.equalTo(categoryView)
            $0.leading.equalToSuperview().inset(40)
            $0.width.height.equalTo(100)
        }
        goToOtherCategoryLabel.snp.makeConstraints {
            $0.centerY.equalTo(cafeMenuCategoryImage)
            $0.leading.equalTo(cafeMenuCategoryImage.snp.trailing).offset(30)
        }
        firstNumberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(34)
        }
        secondNumberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(firstNumberLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(34)
        }
        thirdNumberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(secondNumberLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(34)
        }
        fourthNumberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(thirdNumberLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(34)
        }
        fifthNumberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(fourthNumberLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(34)
        }
        sixthNumberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(fifthNumberLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(34)
        }
        plusView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(sixthNumberLabel.snp.trailing).offset(6)
            $0.width.height.equalTo(15)
        }
        seventhNumberLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.leading.equalTo(plusView.snp.trailing).offset(3)
            $0.width.height.equalTo(34)
        }
        numberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(numberLabel.snp.bottom).offset(1)
            $0.centerX.equalToSuperview()
        }
        moneyLabel.snp.makeConstraints {
            $0.top.equalTo(lottoView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
    }
}
