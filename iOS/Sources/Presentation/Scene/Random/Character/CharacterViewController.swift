import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import KeychainSwift

class CharacterViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: CharacterViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()

    // MARK: - UI
    private let userProfileImg = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 41
    }
    private let userName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
    }
    private let userIntroduceText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 16, family: .medium)
        $0.textAlignment = .center
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 인물")
        viewAppear.accept(())
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func bind() {
        let input = CharacterViewModel.Input(viewAppear: viewAppear.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input)

        output.characterValue
            .subscribe(onNext: { [weak self] in
                self?.userProfileImg.kf.setImage(with: $0.imageUrl)
                self?.userName.text = $0.name
                self?.userIntroduceText.text = $0.introduce
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension CharacterViewController {
    private func addSubviews() {
        [userProfileImg,
         userName,
         userIntroduceText
        ].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        userProfileImg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(150)
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        userName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userProfileImg.snp.bottom).offset(40)
        }
        userIntroduceText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userName.snp.bottom).offset(6)
        }
    }
}
