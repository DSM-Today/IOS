import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class UserProfileViewController: UIViewController {
    private var disposeBag = DisposeBag()

    // MARK: - UI
    private let introduceText = UILabel().then {
        $0.text = "한 줄 소개"
        $0.font = .notoSansFont(ofSize: 12, family: .regular)
    }
    private let introduceTextField = UITextField().then {
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        $0.leftViewMode = .always
    }
    private let birthText = UILabel().then {
        $0.text = "생년월일"
        $0.font = .notoSansFont(ofSize: 12, family: .regular)
        $0.textColor = .primary
    }
    private let birthPicker = UIDatePicker().then {
        $0.preferredDatePickerStyle = .automatic
        $0.datePickerMode = .date
        $0.locale = Locale(identifier: "ko-KR")
        $0.timeZone = .autoupdatingCurrent
    }
    private let agreeText = UILabel().then {
        $0.text = "입력하신 정보가 '오늘의 인물'에 쓰일 수 있습니다.\n동의하십니까?"
        $0.numberOfLines = 2
        $0.font = .notoSansFont(ofSize: 13, family: .medium)
    }
    private let agreeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
    }
    private let completeButton = UIButton(type: .system).then {
        $0.setTitle("완료", for: .normal)
        $0.backgroundColor = .primary
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setDemoData()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("회원 정보")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Button
    private func setButton() {
        agreeButton.rx.tap
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.agreeButton.isSelected.toggle()
            }).disposed(by: disposeBag)
    }
    private func setDemoData() {
    }
}

// MARK: - Layout
extension UserProfileViewController {
    private func addSubviews() {
        [introduceText,
         introduceTextField,
         birthText,
         birthPicker,
         agreeText,
         agreeButton,
         completeButton].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        introduceText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(246)
            $0.leading.equalToSuperview().inset(40)
        }
        introduceTextField.snp.makeConstraints {
            $0.top.equalTo(introduceText.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(32)
        }
        birthText.snp.makeConstraints {
            $0.top.equalTo(introduceTextField.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        birthPicker.snp.makeConstraints {
            $0.top.equalTo(birthText.snp.bottom)
            $0.leading.equalToSuperview().inset(40)
        }
        agreeText.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(90)
            $0.leading.equalToSuperview().inset(38)
        }
        agreeButton.snp.makeConstraints {
            $0.leading.equalTo(agreeText.snp.trailing).offset(15)
            $0.centerY.equalTo(agreeText.snp.centerY)
        }
        completeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(35)
        }
    }
}
