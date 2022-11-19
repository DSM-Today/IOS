import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import Kingfisher

class NewsViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: NewsViewModel!
    private var url = URL(string: "")

    private let disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()

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
        bind()
        setButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.contentTextView.isEditable = false
        setNavigation("뉴스")
        viewAppear.accept(())
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Button
    private func setButton() {
        moveToNewsButton.rx.tap
            .asObservable()
            .subscribe(onNext: {
                UIApplication.shared.open(self.url!)
            })
            .disposed(by: disposeBag)
    }

    private func bind() {
        let input = NewsViewModel.Input(viewAppear: viewAppear.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input)

        output.newsValue
            .subscribe(onNext: { [weak self] in
                self?.titleLabel.text = $0.title
                self?.newsImage.kf.setImage(with: $0.imageUrl)
                self?.contentTextView.text = $0.content
                self?.url = $0.directUrl
            })
            .disposed(by: disposeBag)
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
            $0.leading.trailing.equalToSuperview().inset(5)
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
