import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class QuizViewController: UIViewController {
    private var disposeBag = DisposeBag()

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
        $0.backgroundColor = .blue8
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .notoSansFont(ofSize: 15, family: .regular)
    }
    private let resulText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 13, family: .regular)
        $0.textColor = .red1
        $0.text = "답이 아닌데용?"
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        setDemoData()
        setButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 퀴즈")
        resulText.isHidden = true
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Button
    private func setButton() {
        answerBtn.rx.tap
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.okAlert(title: "땅콩", action: {_ in
                })
            }).disposed(by: disposeBag)
    }
    private func setDemoData() {
        self.difficultyText.text = "상"
        self.quizText.text = "김시안이 넘어지면?"
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
         resulText,
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
            $0.centerX.centerY.equalToSuperview()
        }
        answerTextField.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(104)
            $0.leading.equalToSuperview().inset(90)
            $0.width.equalTo(185)
            $0.height.equalTo(40)
        }
        confirmBtn.snp.makeConstraints {
            $0.centerY.equalTo(answerTextField.snp.centerY)
            $0.leading.equalTo(answerTextField.snp.trailing).offset(9)
            $0.width.equalTo(47)
            $0.height.equalTo(40)
        }
        resulText.snp.makeConstraints {
            $0.top.equalTo(answerTextField.snp.bottom)
                .offset(3)
            $0.leading.equalToSuperview().inset(100)
        }
        answerBtn.snp.makeConstraints {
            $0.top.equalTo(answerTextField.snp.bottom).offset(32)
            $0.width.equalTo(104)
            $0.height.equalTo(32)
            $0.centerX.equalToSuperview()
        }
    }
}
