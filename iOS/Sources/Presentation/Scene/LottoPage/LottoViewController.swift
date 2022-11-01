import UIKit

import SnapKit
import Then

class LottoViewController: UIViewController {

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
    private let lottoElementView = UIView().then {
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
    private let redCircleView = UIImageView().then {
        $0.image = UIImage(systemName: "circle")
        $0.tintColor = .red1
    }
    private let orangeCircleView = UIImageView().then {
        $0.image = UIImage(systemName: "circle")
        $0.tintColor = .orange1
    }
    private let yellowCircleView = UIImageView().then {
        $0.image = UIImage(systemName: "circle")
        $0.tintColor = .yellow1
    }
    private let blueCircleView = UIImageView().then {
        $0.image = UIImage(systemName: "circle")
        $0.tintColor = .blue7
    }
    private let purpleCircleView = UIImageView().then {
        $0.image = UIImage(systemName: "circle")
        $0.tintColor = .purple1
    }
    private let grayCircleView = UIImageView().then {
        $0.image = UIImage(systemName: "circle")
        $0.tintColor = .gray2
    }
    private let plusCircleView = UIImageView().then {
        $0.image = UIImage(systemName: "circle")
        $0.tintColor = .blue9
    }
    private let plusView = UIImageView().then {
        $0.image = UIImage(systemName: "plus")
        $0.tintColor = .black
    }
    private let numberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 22, family: .medium)
        $0.text = "1038회차"
    }
    private let dateLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.text = "2022.10.22"
    }
    private let moneyLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
        $0.text = "2,868,856,209원"
        $0.textColor = .primary
    }
    private let firstNumberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.text = "26"
    }
    private let secondNumberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.text = "26"
    }
    private let thirdNumberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.text = "26"
    }
    private let fourthNumberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.text = "26"
    }
    private let fifthNumberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.text = "26"
    }
    private let sixthNumberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.text = "26"
    }
    private let seventhNumberLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.text = "26"
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
        self.title = "로또"
        if  let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.shadowColor = .clear
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
    private func setDemoData() {
        self.cafeMenuCategoryImage.image = UIImage(systemName: "square.fill")
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

        [redCircleView,
         orangeCircleView,
         yellowCircleView,
         blueCircleView,
         purpleCircleView,
         grayCircleView,
         plusView,
         plusCircleView,
         numberLabel,
         dateLabel,
         firstNumberLabel,
         secondNumberLabel,
         thirdNumberLabel,
         fourthNumberLabel,
         fifthNumberLabel,
         sixthNumberLabel,
         seventhNumberLabel
        ].forEach { lottoElementView.addSubview($0) }

        lottoView.addSubview(lottoElementView)
    }
    private func makeSubviewConstraints() {
        todayEatLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(29)
            $0.centerX.equalToSuperview()
        }
        lottoElementView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(34)
            $0.width.equalTo(295)
        }
        lottoView.snp.makeConstraints {
            $0.top.equalTo(todayEatLabel.snp.bottom).offset(38)
            $0.height.equalTo(260)
            $0.width.equalTo(330)
            $0.centerX.equalToSuperview()
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
        redCircleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(34)
        }
        orangeCircleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(redCircleView.snp.trailing).offset(6)
            $0.width.height.equalTo(34)
        }
        yellowCircleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(orangeCircleView.snp.trailing).offset(6)
            $0.width.height.equalTo(34)
        }
        blueCircleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(yellowCircleView.snp.trailing).offset(6)
            $0.width.height.equalTo(34)
        }
        purpleCircleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(blueCircleView.snp.trailing).offset(6)
            $0.width.height.equalTo(34)
        }
        grayCircleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(purpleCircleView.snp.trailing).offset(6)
            $0.width.height.equalTo(34)
        }
        plusView.snp.makeConstraints {
            $0.centerY.equalTo(grayCircleView)
            $0.leading.equalTo(grayCircleView.snp.trailing).offset(6)
            $0.width.height.equalTo(15)
        }
        plusCircleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(plusView.snp.trailing).offset(6)
            $0.width.height.equalTo(34)
        }
        firstNumberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(redCircleView)
        }
        secondNumberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(orangeCircleView)
        }
        thirdNumberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(yellowCircleView)
        }
        fourthNumberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(blueCircleView)
        }
        fifthNumberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(purpleCircleView)
        }
        sixthNumberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(grayCircleView)
        }
        seventhNumberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(plusCircleView)
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
