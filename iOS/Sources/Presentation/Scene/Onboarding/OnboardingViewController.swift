import UIKit

import SnapKit
import Then

class OnboardingViewController: UIViewController {

    // MARK: - UI
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Logo2")
        $0.contentMode = .scaleAspectFit
    }
    private let googleLoginButton = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
    }
    private let googleButtonTitle = UILabel().then {
        $0.text = "Google 계정으로 로그인"
        $0.textColor = .primary
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    private let googleImage = UIImageView().then {
        $0.image = UIImage(named: "Google")
        $0.contentMode = .scaleAspectFit
    }
    private let naverLoginButton = UIButton(type: .system).then {
        $0.backgroundColor = .green1
        $0.layer.cornerRadius = 5
    }
    private let naverButtonTitle = UILabel().then {
        $0.text = "Naver 계정으로 로그인"
        $0.textColor = .white
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let naverImage = UIImageView().then {
        $0.image = UIImage(named: "Naver")
        $0.contentMode = .scaleAspectFit
    }
    private let kakaoLoginButton = UIButton(type: .system).then {
        $0.backgroundColor = .yellow1
        $0.layer.cornerRadius = 5
    }
    private let kakaoButtonTitle = UILabel().then {
        $0.text = "Kakao 계정으로 로그인"
        $0.textColor = .brown1
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let kakaoImage = UIImageView().then {
        $0.image = UIImage(named: "Kakao")
        $0.contentMode = .scaleAspectFit
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
        [googleImage, googleButtonTitle].forEach { googleLoginButton.addSubview($0) }
        [naverImage, naverButtonTitle].forEach { naverLoginButton.addSubview($0) }
        [kakaoImage, kakaoButtonTitle].forEach { kakaoLoginButton.addSubview($0) }
        [logoImage, googleLoginButton, naverLoginButton, kakaoLoginButton].forEach { view.addSubview($0) }
    }

    func makeSubviewConstraints() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.centerX.equalToSuperview()
        }
        googleImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(36)
            $0.leading.equalToSuperview().inset(58)
        }
        googleButtonTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(googleImage.snp.trailing).offset(12)
            $0.trailing.greaterThanOrEqualToSuperview().inset(40)
        }
        googleLoginButton.snp.makeConstraints {
            $0.top.lessThanOrEqualTo(logoImage.snp.bottom).offset(228)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(23)
        }
        naverImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(36)
            $0.leading.equalToSuperview().inset(58)
        }
        naverButtonTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(naverImage.snp.trailing).offset(12)
            $0.trailing.greaterThanOrEqualToSuperview().inset(40)
        }
        naverLoginButton.snp.makeConstraints {
            $0.top.equalTo(googleLoginButton.snp.bottom).offset(21)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(23)
        }
        kakaoImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(36)
            $0.leading.equalToSuperview().inset(58)
        }
        kakaoButtonTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(kakaoImage.snp.trailing).offset(12)
            $0.trailing.greaterThanOrEqualToSuperview().inset(40)
        }
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(naverLoginButton.snp.bottom).offset(21)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(23)
            $0.bottom.equalToSuperview().inset(52)
        }
    }
}
