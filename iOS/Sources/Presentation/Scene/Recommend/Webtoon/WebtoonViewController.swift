import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class WebtoonViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: WebtoonViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()
    private var url: URL? = URL(string: "")

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
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.backgroundColor = .blue5
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation("오늘의 웹툰")
        viewAppear.accept(())
        self.contentTextView.isEditable = false
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setButton() {
        self.moveWebtoonButton.rx.tap
            .subscribe(onNext: { [weak self] in
                UIApplication.shared.open((self?.url)!)
            })
            .disposed(by: disposeBag)
    }
    // MARK: - Bind
    private func bind() {
        let input = WebtoonViewModel.Input(viewAppear: viewAppear.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input)

        output.webtoonValue
            .subscribe(onNext: { [weak self] in
                self?.ageLimitLabel.text = $0.isAdult
                self?.currentSituationLabel.text = $0.isWorking
                self?.webtoonImage.kf.setImage(with: $0.imageUrl)
                self?.writerLabel.text = $0.writer
                self?.genreLabel.text = $0.genre
                self?.contentTextView.text = $0.comment
                self?.url = $0.directUrl
            })
            .disposed(by: disposeBag)
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
            $0.top.equalTo(view.snp.topMargin).offset(10)
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
            $0.top.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview()
        }
        moveWebtoonButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(65)
        }
    }
}
