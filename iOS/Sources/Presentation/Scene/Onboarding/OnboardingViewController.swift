import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import GoogleSignIn

class OnboardingViewController: UIViewController {
    // MARK: ViewModel
    var viewModel: OnboardingViewModel!

    private var disposeBag = DisposeBag()
    private let idToken = PublishRelay<String>()

    // MARK: - UI
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Logo2")
        $0.contentMode = .scaleAspectFit
    }
    private let googleLoginButton = UIButton(configuration: .filled()).then {
        $0.configuration?.baseBackgroundColor = .white
        $0.configuration?.baseForegroundColor = .primary
        $0.setTitle("Google 계정으로 로그인", for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.configuration?.image = UIImage(named: "Google")
        $0.configuration?.imagePadding = 11
        $0.configuration?.imagePlacement = .leading
        $0.contentHorizontalAlignment = .center
        $0.layer.cornerRadius = 5
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue1
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Bind
    private func bind() {
        let input = OnboardingViewModel.Input(
            googleLoginButtonDidTap: googleLoginButton.rx.tap.asDriver(),
            idToken: idToken.asDriver(onErrorJustReturn: "")
        )

        let output = viewModel.transform(input)

        output.clientID
            .subscribe(onNext: {
                GIDSignIn.sharedInstance.signIn(
                    with: .init(clientID: $0.clientID),
                    presenting: self
                ) { user, error in
                    guard error == nil else { return }
                    guard let user = user else { return }

                    user.authentication.do { [self] authentication, error in
                        guard error == nil else { return }
                        guard let authentication = authentication else { return }

                        self.idToken.accept(authentication.idToken ?? "")
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension OnboardingViewController {
    func addSubviews() {
        [logoImage, googleLoginButton].forEach { view.addSubview($0) }
    }

    func makeSubviewConstraints() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.centerX.equalToSuperview()
        }
        googleLoginButton.snp.makeConstraints {
            $0.top.lessThanOrEqualTo(logoImage.snp.bottom).offset(400)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(23)
        }
    }
}
