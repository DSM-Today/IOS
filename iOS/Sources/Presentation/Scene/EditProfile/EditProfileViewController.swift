import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class EditProfileViewController: UIViewController {

    // MARK: - UI
    private let profileImgView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = $0.frame.width / 2
        $0.tintColor = .gray3
    }
    private let profileImgEditBtn = UIButton(type: .system).then {
        $0.backgroundColor = .blue8
        $0.setTitle("프로필 수정", for: .normal)
        $0.setTitleColor(.primary, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 10, family: .medium)
        $0.layer.cornerRadius = 10
    }
    private let line = UIView().then {
        $0.layer.borderColor = UIColor.gray3.cgColor
        $0.layer.borderWidth = 1
    }
    private let nicknameText = UILabel().then {
        $0.text = "닉네임"
        $0.font = .notoSansFont(ofSize: 15, family: .regular)
    }
    private let nicknameTextField = UITextField().then {
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 5
    }
    private let introduceText = UILabel().then {
        $0.text = "한 줄 소개"
        $0.font = .notoSansFont(ofSize: 15, family: .regular)
    }
    private let introduceTextField = UITextField().then {
        $0.backgroundColor = .gray3
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 5
    }
    private let birthText = UILabel().then {
        $0.text = "생년월일"
        $0.font = .notoSansFont(ofSize: 24, family: .regular)
        $0.textColor = .primary
    }
    private let birthPicker = UIDatePicker().then {
        $0.preferredDatePickerStyle = .automatic
        $0.datePickerMode = .date
        $0.locale = Locale(identifier: "ko-KR")
        $0.timeZone = .autoupdatingCurrent
    }
    private let completeButton = UIButton(type: .system).then {
        $0.setTitle("완료", for: .normal)
        $0.backgroundColor = .primary
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray1
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
        self.title = "내 정보 수정"
    }
    private func setDemoData() {
        self.profileImgView.image = UIImage(systemName: "person.circle.fill")
    }
}

// MARK: - Layout
extension EditProfileViewController {
    private func addSubviews() {
        [profileImgView,
         profileImgEditBtn,
         line,
         nicknameText,
         nicknameTextField,
         introduceText,
         introduceTextField,
         birthText,
         birthPicker,
         completeButton].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        profileImgView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(93)
            $0.width.height.equalTo(100)
        }
        profileImgEditBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImgView.snp.bottom).offset(10)
            $0.height.equalTo(20)
            $0.width.equalTo(60)
        }
        line.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(1)
            $0.top.equalTo(profileImgEditBtn.snp.bottom).offset(12)
        }
        nicknameText.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(55)
        }
        nicknameTextField.snp.makeConstraints {
            $0.width.equalTo(226)
            $0.height.equalTo(32)
            $0.leading.equalTo(nicknameText.snp.trailing).offset(28)
            $0.centerY.equalTo(nicknameText.snp.centerY)
        }
        introduceText.snp.makeConstraints {
            $0.top.equalTo(nicknameText.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(43)
        }
        introduceTextField.snp.makeConstraints {
            $0.width.equalTo(226)
            $0.height.equalTo(32)
            $0.centerY.equalTo(introduceText.snp.centerY)
            $0.leading.equalTo(introduceText.snp.trailing).offset(16)
        }
        birthText.snp.makeConstraints {
            $0.top.equalTo(introduceText.snp.bottom).offset(35)
            $0.leading.equalToSuperview().inset(41)
        }
        birthPicker.snp.makeConstraints {
            $0.top.equalTo(birthText.snp.bottom).offset(9)
            $0.leading.equalToSuperview().inset(41)
        }
        completeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(35)
        }
    }
}
