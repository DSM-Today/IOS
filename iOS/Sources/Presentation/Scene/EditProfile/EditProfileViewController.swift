import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class EditProfileViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: EditProfileViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()
    private let image = PublishRelay<Data>()

    // MARK: - UI
    private let imagePicker = UIImagePickerController()
    private let profileImgView = UIImageView().then {
        $0.contentMode = .scaleToFill
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
        $0.addLeftPadding()
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
        $0.addLeftPadding()
    }
    private let birthText = UILabel().then {
        $0.text = "생년월일"
        $0.font = .notoSansFont(ofSize: 15, family: .regular)
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
        setButton()
        bind()
        imagePicker.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("내 정보 수정")
        viewAppear.accept(())
        self.navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
        profileImgView.layer.cornerRadius = profileImgView.frame.width / 2
        profileImgView.clipsToBounds = true
    }
    private func setButton() {
        profileImgEditBtn.rx.tap
            .subscribe(onNext: {
                self.actionSheet()
            })
            .disposed(by: disposeBag)
    }
    // MARK: - Bind
    private func bind() {
        let input = EditProfileViewModel.Input(
            viewAppear: viewAppear.asDriver(onErrorJustReturn: ()),
            image: image.asDriver(onErrorJustReturn: Data()),
            name: nicknameTextField.rx.text.orEmpty.asDriver(),
            introduce: introduceTextField.rx.text.orEmpty.asDriver(),
            birthDay: birthPicker.rx.date.asDriver(),
            completeButtonDidTap: completeButton.rx.tap.asDriver()
        )

        let output = viewModel.transform(input)

        output.profileValue
            .subscribe(onNext: { [weak self] in
                self?.profileImgView.kf.setImage(with: $0.imageUrl)
                self?.nicknameTextField.text = $0.name
                self?.introduceTextField.text = $0.introduce
                self?.birthPicker.date = $0.birthDay
            })
            .disposed(by: disposeBag)
    }
    private func actionSheet() {
        let actionSheet = UIAlertController(
            title: "프로필 사진을 변경하시겠습니까?",
            message: "사진을 변경할 때 사용할 것을 골라주십시오",
            preferredStyle: .actionSheet
        )
        let library = UIAlertAction(
            title: "사진 앨범",
            style: .default
        ) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: false)
        }
        let camera = UIAlertAction(
            title: "카메라",
            style: .default
        ) { _ in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: false)
        }
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        [library, camera, cancel].forEach { actionSheet.addAction($0) }
        present(actionSheet, animated: true)
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
    // swiftlint:disable function_body_length
    private func makeSubviewConstraints() {
        profileImgView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.topMargin).inset(20)
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
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(43)
        }
        nicknameTextField.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.leading.equalTo(nicknameText.snp.trailing).offset(28)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(nicknameText.snp.centerY)
        }
        introduceText.snp.makeConstraints {
            $0.top.equalTo(nicknameText.snp.bottom).offset(26)
            $0.centerX.equalTo(nicknameText.snp.centerX)
        }
        introduceTextField.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.centerY.equalTo(introduceText.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.leading.equalTo(nicknameTextField.snp.leading)
        }
        birthText.snp.makeConstraints {
            $0.top.equalTo(introduceText.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(20)
        }
        birthPicker.snp.makeConstraints {
            $0.centerY.equalTo(birthText)
            $0.leading.equalTo(nicknameTextField.snp.leading)
        }
        completeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(35)
        }
    }
}

// MARK: - ImagePicker
extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImgView.image = image
            self.image.accept(image.pngData() ?? Data())
        }
        self.dismiss(animated: true)
    }
}
