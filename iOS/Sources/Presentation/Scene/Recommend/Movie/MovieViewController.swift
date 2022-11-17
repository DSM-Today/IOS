import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import Kingfisher

class MovieViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: MovieViewModel!
    private var url = URL(string: "")

    let movieBottomSheetViewController = MovieBottomSheetViewController()
    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()

    // MARK: - UI
    private let commentLabel = UILabel().then {
        $0.text = "오늘 뭐 보지?"
        $0.font = .notoSansFont(ofSize: 22, family: .bold)
    }
    private let movieImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private let movieText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let explainButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("설명", for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        $0.layer.shadowOpacity = 0.3
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let goToMoviewSiteButton = UIButton(type: .system).then {
        $0.setTitle("바로 예매하러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .medium)
        $0.backgroundColor = .blue5
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation("오늘의 영화")
        viewAppear.accept(())
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setButton() {
        explainButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.presentModal()
            }).disposed(by: disposeBag)
        goToMoviewSiteButton.rx.tap
            .subscribe(onNext: {
                UIApplication.shared.open(self.url!)
            })
            .disposed(by: disposeBag)    }
    private func presentModal() {
        movieBottomSheetViewController.modalPresentationStyle = .pageSheet

        if let sheet = movieBottomSheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 41
        }
        self.present(movieBottomSheetViewController, animated: true)
    }
    private func bind() {
        let input = MovieViewModel.Input(viewAppear: viewAppear.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input)

        output.movieValue
            .subscribe(onNext: { [weak self] in
                self?.movieImageView.kf.setImage(with: $0.imageUrl)
                self?.movieText.text = $0.title
                self?.movieBottomSheetViewController.contentTextView.text = $0.content
                self?.url = $0.directUrl
            })
            .disposed(by: disposeBag)
    }
}

// MARK: Layout
extension MovieViewController {
    private func addSubviews() {
        [commentLabel,
         movieImageView,
         movieText,
         explainButton,
         goToMoviewSiteButton]
            .forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(29)
            $0.centerX.equalToSuperview()
        }
        movieImageView.snp.makeConstraints {
            $0.top.equalTo(commentLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(290)
            $0.width.equalTo(200)
        }
        movieText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(movieImageView.snp.bottom).offset(12)
        }
        explainButton.snp.makeConstraints {
            $0.height.equalTo(140)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        goToMoviewSiteButton.snp.makeConstraints {
            $0.height.equalTo(85)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
