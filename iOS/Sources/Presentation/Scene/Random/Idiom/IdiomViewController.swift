import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class IdiomViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: IdiomViewModel!

    private let disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()

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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setLayout()
        addSubviews()
        makeSubviewConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewAppear.accept(())
        self.meanTextView.isEditable = false
        setNavigation("오늘의 사자성어")
        navigationController?.navigationBar.setBackButtonToArrow()
    }

    private func setLayout() {
        [firstIdiomLabel, secondIdiomLabel, thirdIdiomLabel, fourthIdiomLabel,
        meanTextView]
            .forEach { $0.clipsToBounds = true }
    }
    // MARK: - Bind
    private func bind() {
        let input = IdiomViewModel.Input(viewAppear: viewAppear.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input)

        output.idiomValue
            .subscribe(onNext: { [weak self] in
                let idiom = Array($0.korean)
                self?.firstIdiomLabel.text = String(idiom[0])
                self?.secondIdiomLabel.text = String(idiom[1])
                self?.thirdIdiomLabel.text = String(idiom[2])
                self?.fourthIdiomLabel.text = String(idiom[3])
                self?.chineseCharacterLabel.text = $0.chinese
                self?.meanTextView.text = $0.describe
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension IdiomViewController {
    private func addSubviews() {
        [stackView, chineseCharacterLabel, meanTextView]
            .forEach { view.addSubview($0) }
        [firstIdiomLabel, secondIdiomLabel, thirdIdiomLabel, fourthIdiomLabel]
            .forEach { stackView.addSubview($0) }
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
    }
}
