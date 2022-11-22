import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class MyPageViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: MyPageViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()
    private let logOutButtonDidTap = PublishRelay<Void>()

    // MARK: - UI
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private let userName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 17, family: .medium)
    }
    private let birthText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 16, family: .regular)
    }
    private let editProfileButton = UIButton(type: .system).then {
        $0.backgroundColor = .blue8
        $0.setTitle("내 정보 수정", for: .normal)
        $0.setTitleColor(.primary, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 10, family: .medium)
        $0.layer.cornerRadius = 10
    }
    private let introduceText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 15, family: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    private let favoriteText = UILabel().then {
        $0.text = "즐겨찾기"
        $0.font = .notoSansFont(ofSize: 16, family: .bold)
        $0.textColor = .gray2
    }
    private let favoriteTableView = UITableView().then {
        $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
        $0.rowHeight = 110
        $0.backgroundColor = .gray1
    }
    private let logOutButton = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.red1, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray3.cgColor
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("마이페이지")
        viewAppear.accept(())
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        self.profileImageView.clipsToBounds = true
        addSubviews()
        makeSubviewConstraints()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    // MARK: - Bind
    private func bind() {
        let input = MyPageViewModel.Input(
            viewAppear: viewAppear.asDriver(onErrorJustReturn: ()),
            moveToEditProfile: editProfileButton.rx.tap.asDriver(),
            index: favoriteTableView.rx.itemSelected.asDriver(),
            logoutButtonDidTap: logOutButtonDidTap.asDriver(onErrorJustReturn: ())
        )

        let output = viewModel.transform(input)

        output.profileValue
            .subscribe(onNext: { [weak self] in
                self?.profileImageView.kf.setImage(with: $0.imageUrl)
                self?.userName.text = $0.name
                self?.introduceText.text = $0.introduce
                self?.birthText.text = $0.birthDay.toString(format: "yyyy.MM.dd")
            })
            .disposed(by: disposeBag)

        output.bookmarkList.bind(to: favoriteTableView.rx.items(
            cellIdentifier: "MyPageTableViewCell",
            cellType: MyPageTableViewCell.self
        )) { _, items, cell in
            cell.setData(items)
        }
        .disposed(by: disposeBag)
    }
    // MARK: - Button
    private func setButton() {
        logOutButton.rx.tap
            .subscribe(onNext: {
                self.alert(title: "로그아웃 하시겠습니까?") { _ in
                    self.logOutButtonDidTap.accept(())
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension MyPageViewController {
    private func addSubviews() {
        [profileImageView,
         userName,
         birthText,
         editProfileButton,
         introduceText,
         favoriteText,
         favoriteTableView,
         logOutButton].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(18)
            $0.width.height.equalTo(62)
        }
        userName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(108)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(6.75)
        }
        birthText.snp.makeConstraints {
            $0.centerY.equalTo(userName.snp.centerY)
            $0.leading.equalTo(userName.snp.trailing).offset(7)
        }
        editProfileButton.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom)
            $0.leading.equalTo(userName.snp.leading)
            $0.width.equalTo(66)
            $0.height.equalTo(20)
        }
        introduceText.snp.makeConstraints {
            $0.top.equalTo(editProfileButton.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
        favoriteText.snp.makeConstraints {
            $0.top.equalTo(introduceText.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(45)
        }
        favoriteTableView.snp.makeConstraints {
            $0.top.equalTo(favoriteText.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(45)
            $0.bottom.equalToSuperview()
        }
        logOutButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottomMargin)
            $0.height.equalTo(55)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
