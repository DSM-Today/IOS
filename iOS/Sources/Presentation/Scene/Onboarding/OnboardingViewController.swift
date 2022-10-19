import UIKit

import SnapKit
import Then

class OnboardingViewController: UIViewController {

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
    private let naverLoginButton = UIButton(configuration: .filled()).then {
        $0.configuration?.baseBackgroundColor = .green1
        $0.configuration?.baseForegroundColor = .white
        $0.setTitle("Naver 계정으로 로그인", for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.configuration?.image = UIImage(named: "Naver")
        $0.configuration?.imagePadding = 11
        $0.configuration?.imagePlacement = .leading
        $0.contentHorizontalAlignment = .center
        $0.layer.cornerRadius = 5
    }
    private let kakaoLoginButton = UIButton(configuration: .filled()).then {
        $0.configuration?.baseBackgroundColor = .yellow1
        $0.configuration?.baseForegroundColor = .brown1
        $0.setTitle("Kakao 계정으로 로그인", for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.configuration?.image = UIImage(named: "Kakao")
        $0.configuration?.imagePadding = 11
        $0.configuration?.imagePlacement = .leading
        $0.contentHorizontalAlignment = .center
        $0.layer.cornerRadius = 5
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue1
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
}

// MARK: - Layout
extension OnboardingViewController {
    func addSubviews() {
        [logoImage, googleLoginButton, naverLoginButton, kakaoLoginButton].forEach { view.addSubview($0) }
    }

    func makeSubviewConstraints() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.centerX.equalToSuperview()
        }
        googleLoginButton.snp.makeConstraints {
            $0.top.lessThanOrEqualTo(logoImage.snp.bottom).offset(228)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(23)
        }
        naverLoginButton.snp.makeConstraints {
            $0.top.equalTo(googleLoginButton.snp.bottom).offset(21)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(23)
        }
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(naverLoginButton.snp.bottom).offset(21)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(23)
            $0.bottom.equalToSuperview().inset(52)
        }
    }
}
