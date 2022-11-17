import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class WebtoonViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: WebtoonViewModel!

    // MARK: - UI
    private let webtoonInformationView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.2
    }
    private let ageLimitLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 16, family: .medium)
        $0.textColor = .gray2
    }
    private let currentSituationLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 16, family: .medium)
        $0.textColor = .gray2
        $0.backgroundColor = .gray3
        $0.layer.cornerRadius = 17
        $0.textAlignment = .center
        $0.clipsToBounds = true
    }
    private let webtoonImage = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private let writerLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
        $0.textAlignment = .center
    }
    private let genreLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 16, family: .medium)
        $0.textAlignment = .center
    }
    private let contentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.2
    }
    private let contentTextView = UITextView().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    private let moveWebtoonButton = UIButton(type: .system).then {
        $0.setTitle("웹툰 보러가기", for: .normal)
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
        view.backgroundColor = .gray1
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation("오늘의 웹툰")
        self.contentTextView.isEditable = false
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setDemoData() {
        ageLimitLabel.text = "전체연령가"
        currentSituationLabel.text = "휴재"
        webtoonImage.image = UIImage(systemName: "person")
        webtoonImage.backgroundColor = .primary
        writerLabel.text = "기무기영"
        genreLabel.text = "호러물"
        contentTextView.text = "집에서 거울을 보십시오 그게 엄청난 공포입니다. 여러분들 ><"
    }
}

// MARK: - Layout
extension WebtoonViewController {
    private func addSubviews() {
        [webtoonInformationView, contentView, moveWebtoonButton].forEach { view.addSubview($0) }
        [ageLimitLabel, currentSituationLabel, webtoonImage, writerLabel, genreLabel]
            .forEach { webtoonInformationView.addSubview($0) }
        contentView.addSubview(contentTextView)
    }

    private func makeSubviewConstraints() {
        webtoonInformationView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(29)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        ageLimitLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview().inset(26)
        }
        currentSituationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.trailing.equalToSuperview().inset(46)
            $0.width.equalTo(85)
            $0.height.equalTo(33)
        }
        webtoonImage.snp.makeConstraints {
            $0.top.equalTo(currentSituationLabel.snp.bottom).offset(20)
            $0.width.equalTo(220)
            $0.height.equalTo(271)
            $0.centerX.equalToSuperview()
        }
        writerLabel.snp.makeConstraints {
            $0.top.equalTo(webtoonImage.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        genreLabel.snp.makeConstraints {
            $0.top.equalTo(writerLabel.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.top.equalTo(genreLabel.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        contentTextView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.trailing.equalToSuperview().inset(54)
            $0.bottom.equalToSuperview()
        }
        moveWebtoonButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(85)
        }
    }
}
