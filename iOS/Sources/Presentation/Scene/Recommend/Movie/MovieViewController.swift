import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class MovieViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: MovieViewModel!

    let movieBottomSheetViewController = MovieBottomSheetViewController()
    private var disposeBag = DisposeBag()

    // MARK: - UI
    private let commentLabel = UILabel().then {
        $0.text = "오늘 뭐 보지?"
        $0.font = .notoSansFont(ofSize: 22, family: .bold)
    }
    private let movieImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
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
        setDemoData()
        setButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation("오늘의 영화")
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func setButton() {
        explainButton.rx.tap
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.presentModal()
            }).disposed(by: disposeBag)
    }
    private func presentModal() {
        movieBottomSheetViewController.modalPresentationStyle = .pageSheet

        if let sheet = movieBottomSheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 41
        }
        self.present(movieBottomSheetViewController, animated: true)
    }
    private func setDemoData() {
        movieImageView.image = UIImage(systemName: "person.fill")
        movieImageView.backgroundColor = .gray
    }
}

// MARK: Layout
extension MovieViewController {
    private func addSubviews() {
        [commentLabel, movieImageView, explainButton, goToMoviewSiteButton]
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
        explainButton.snp.makeConstraints {
            $0.height.equalTo(120)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        goToMoviewSiteButton.snp.makeConstraints {
            $0.height.equalTo(85)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
