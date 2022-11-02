import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class BookViewController: UIViewController {
    let bookBottomSheetViewController = BookBottomSheetViewController()
    private var disposeBag = DisposeBag()

    // MARK: - UI
    private let publisherText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
        $0.textColor = .gray2
    }
    private let bookImage = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private let bookNameText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
    }
    private let authorText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 19, family: .regular)
    }
    private let starImage = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.tintColor = .yellow1
    }
    private let ratingText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    private let ratingerTitle = UILabel().then {
        $0.text = "별점 준 사람"
        $0.font = .notoSansFont(ofSize: 16, family: .regular)
    }
    private let ratingCountText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    private let explainButton = UIButton(type: .system).then {
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
    private let goToBookSiteButton = UIButton(type: .system).then {
        $0.setTitle("구매하러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .medium)
        $0.backgroundColor = .blue5
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        setDemoData()
        setButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 책")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Button
    private func setButton() {
        explainButton.rx.tap
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.presentModal()
            }).disposed(by: disposeBag)
    }
    private func presentModal() {
        bookBottomSheetViewController.modalPresentationStyle = .pageSheet

        if let sheet = bookBottomSheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 41
        }
        self.present(bookBottomSheetViewController, animated: true)
    }
    private func setDemoData() {
        self.publisherText.text = "미래의 창"
        self.bookImage.image = UIImage(systemName: "text.book.closed.fill")
        self.bookNameText.text = "트렌드 코리아 2023"
        self.authorText.text = "김난도 외"
        self.ratingText.text = "8.8"
        self.ratingCountText.text = "4"
    }
}

// MARK: - Layout
extension BookViewController {
    private func addSubviews() {
        [publisherText,
         bookImage,
         bookNameText,
         authorText,
         starImage,
         ratingText,
         ratingerTitle,
         ratingCountText,
         explainButton,
         goToBookSiteButton].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        publisherText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(120)
        }
        bookImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(publisherText.snp.bottom)
            $0.width.equalTo(200)
            $0.height.equalTo(245)
        }
        bookNameText.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        authorText.snp.makeConstraints {
            $0.top.equalTo(bookNameText.snp.bottom)
            $0.trailing.equalToSuperview().inset(123)
        }
        starImage.snp.makeConstraints {
            $0.top.equalTo(authorText.snp.bottom).offset(111)
            $0.leading.equalToSuperview().inset(168)
            $0.width.equalTo(30)
            $0.height.equalTo(25)
        }
        ratingText.snp.makeConstraints {
            $0.centerY.equalTo(starImage.snp.centerY)
            $0.leading.equalTo(starImage.snp.trailing).offset(14)
        }
        ratingerTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ratingText.snp.bottom)
                .offset(9)
        }
        ratingCountText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ratingerTitle.snp.bottom).offset(10)
        }
        explainButton.snp.makeConstraints {
            $0.height.equalTo(140)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        goToBookSiteButton.snp.makeConstraints {
            $0.height.equalTo(85)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
