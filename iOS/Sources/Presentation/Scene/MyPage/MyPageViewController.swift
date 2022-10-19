import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class MyPageViewController: UIViewController {
    private var disposeBag = DisposeBag()

    // MARK: - UI
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = $0.frame.width / 2
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
    }
    private let favoriteText = UILabel().then {
        $0.text = "즐겨찾기"
        $0.font = .notoSansFont(ofSize: 16, family: .bold)
        $0.textColor = .gray2
    }
    private let favoriteTableView = UITableView().then {
        $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
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
        self.view.backgroundColor = .gray1
        setButton()
        setDemoData()
        setTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
    }
    override func viewWillLayoutSubviews() {
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - TableView
    private func setTableView() {
        favoriteTableView.dataSource = self
        favoriteTableView.rowHeight = 110
    }
    // MARK: - Navigation
    private func setNavigation() {
        self.title = "마이페이지"
    }
    // MARK: - Button
    private func setButton() {
        editProfileButton.rx.tap
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.pushViewController(EditProfileViewController())
            })
            .disposed(by: disposeBag)
    }
    private func setDemoData() {
        self.profileImageView.image = UIImage(systemName: "person.fill")
        self.userName.text = "김기영"
        self.birthText.text = "2005.05.30"
        self.introduceText.text = "THE MASTER OF  KIM  HERO\n심장을 공격하는 인천의 야수를 거느리는 남자"
        self.introduceText.numberOfLines = 2
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
            $0.top.equalToSuperview().inset(90)
            $0.leading.equalToSuperview().inset(18)
            $0.width.height.equalTo(62)
        }
        userName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(98)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(6.75)
        }
        birthText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
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
            $0.bottomMargin.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTableViewCell", for: indexPath)
                as? MyPageTableViewCell else { return UITableViewCell() }
        cell.categorieTitle.text = "오늘의 꽃"
        cell.favoriteCount.text = "3"
        return cell
    }
}

extension MyPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
    }
}
