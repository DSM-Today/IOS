import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import RxFlow
import Service

class QuizViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: QuizViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()

    // MARK: - UI
    private let difficultyTitle = UILabel().then {
        $0.text = "난이도"
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let difficultyText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 22, family: .medium)
        $0.textColor = .red1
    }
    private let quizText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 24, family: .medium)
    }
    private let answerTextField = UITextField().then {
        $0.layer.borderColor = UIColor.gray2.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.placeholder = "정답을 입력해주세요"
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        $0.leftViewMode = .always
    }
    private let confirmBtn = UIButton(type: .system).then {
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 15, family: .medium)
        $0.backgroundColor = .blue8
        $0.layer.cornerRadius = 8
        $0.setTitleColor(.blue9, for: .normal)
    }
    private let answerBtn = UIButton(type: .system).then {
        $0.setTitle("정답 보기", for: .normal)
        $0.setTitleColor(.blue9, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 15, family: .regular)
    }
    private let resultText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 13, family: .regular)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 퀴즈")
        navigationController?.navigationBar.setBackButtonToArrow()
        viewAppear.accept(())
        resultText.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Bind
    private func bind() {
        let input = QuizViewModel.Input(
            viewAppear: viewAppear.asDriver(onErrorJustReturn: ()),
            answer: answerTextField.rx.text.orEmpty.asDriver(),
            buttonDidTap: confirmBtn.rx.tap.asDriver(),
            answerButtonDidTap: answerBtn.rx.tap.asDriver()
        )

        let output = viewModel.transform(input)

        output.quiz
            .subscribe(onNext: { [weak self] in
                self?.quizText.text = $0.question
                self?.difficultyText.text = $0.level
            })
            .disposed(by: disposeBag)

        output.isSuccess
            .subscribe(onNext: { [weak self] in
                self?.resultText.isHidden = false
                if $0 {
                    self?.resultText.text = "정답입니다."
                    self?.resultText.textColor = .green
                } else {
                    self?.resultText.text = "정답이 아닙니다."
                    self?.resultText.textColor = .red
                }
            })
            .disposed(by: disposeBag)

        output.answer
            .subscribe(onNext: { [weak self] in
                self?.okAlert(title: $0, action: { _ in })
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension QuizViewController {
    private func addSubviews() {
        [difficultyTitle,
         difficultyText,
         quizText,
         answerTextField,
         confirmBtn,
         resultText,
         answerBtn].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        difficultyTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(142)
        }
        difficultyText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(difficultyTitle.snp.bottom)
        }
        quizText.snp.makeConstraints {
            $0.top.equalTo(difficultyText.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        answerTextField.snp.makeConstraints {
            $0.top.equalTo(quizText.snp.bottom).offset(60)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        confirmBtn.snp.makeConstraints {
            $0.centerY.equalTo(answerTextField.snp.centerY)
            $0.leading.equalTo(answerTextField.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(47)
            $0.height.equalTo(40)
        }
        resultText.snp.makeConstraints {
            $0.top.equalTo(answerTextField.snp.bottom)
                .offset(3)
            $0.leading.equalTo(answerTextField)
        }
        answerBtn.snp.makeConstraints {
            $0.top.equalTo(answerTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
}
