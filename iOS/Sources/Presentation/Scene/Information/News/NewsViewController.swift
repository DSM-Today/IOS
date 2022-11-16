import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import RxFlow

class NewsViewController: UIViewController, Stepper {

    var steps = PublishRelay<Step>()

    // MARK: - UI
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    private let newsImage = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private let contentTextView = UITextView().then {
        $0.backgroundColor = .white
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.textContainerInset = UIEdgeInsets(top: 32, left: 23, bottom: 0, right: 23)
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 10
    }
    private let moveToNewsButton = UIButton(type: .system).then {
        $0.setTitle("뉴스 보러가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .medium)
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.backgroundColor = .blue5
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDemoData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.contentTextView.isEditable = false
        setNavigation("뉴스")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setDemoData() {
        self.titleLabel.text = "김기영 마이다스 해커톤 제출하지도 않아"
        self.newsImage.image = .init(systemName: "person")
        self.newsImage.backgroundColor = .blue
        self.contentTextView.text = "김기영 머리 모자라서 해커톤에 제출하지도 않아 충격을 주었다. 김준호 꼴에 친구라고 같이 제출하지 않아...."
    }
}

// MARK: - Layout
extension NewsViewController {
    private func addSubviews() {
        [titleLabel, newsImage, contentTextView, moveToNewsButton].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(25)
            $0.centerX.equalToSuperview()
        }
        newsImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(260)
            $0.height.equalTo(170)
        }
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(newsImage.snp.bottom).offset(58)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        moveToNewsButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(85)
        }
    }
}
