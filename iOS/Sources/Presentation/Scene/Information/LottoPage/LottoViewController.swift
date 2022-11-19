import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class LottoViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: LottoViewModel!

    private let disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()

    // MARK: - UI
    private let todayLottoLabel = UILabel().then {
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
    private let moneyTitleLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
        $0.text = "당첨금액"
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
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("로또")
        viewAppear.accept(())
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Bind
    private func bind() {
        let input = LottoViewModel.Input(viewAppear: viewAppear.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input)

        output.lottoValue
            .subscribe(onNext: { [weak self] in
                self?.numberLabel.text = $0.round
                self?.dateLabel.text = $0.date.toString(format: "yyyy-MM-dd")
                self?.moneyLabel.text = $0.prize
                self?.firstNumberLabel.text = $0.first
                self?.secondNumberLabel.text = $0.second
                self?.thirdNumberLabel.text = $0.third
                self?.fourthNumberLabel.text = $0.fourth
                self?.fifthNumberLabel.text = $0.fifth
                self?.sixthNumberLabel.text = $0.sixth
                self?.seventhNumberLabel.text = $0.seventh
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension LottoViewController {
    private func addSubviews() {
        [todayLottoLabel,
         lottoView,
         moneyTitleLabel,
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
        todayLottoLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(29)
            $0.centerX.equalToSuperview()
        }
        lottoView.snp.makeConstraints {
            $0.top.equalTo(todayLottoLabel.snp.bottom).offset(38)
            $0.leading.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(260)
        }
        lottoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(34)
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
        moneyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(lottoView.snp.bottom).offset(80)
            $0.centerX.equalToSuperview()
        }
        moneyLabel.snp.makeConstraints {
            $0.top.equalTo(moneyTitleLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
}
