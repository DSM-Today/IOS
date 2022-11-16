import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import Kingfisher

class FlowerViewController: UIViewController {
    
    // MARK: - ViewModel
    var viewModel: FlowerViewModel!
    
    private let disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()

    // MARK: - UI
    private let flowerImg = UIImageView().then {
        $0.layer.cornerRadius = 200
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.backgroundColor = .blue3
    }
    private let flowerName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 24, family: .medium)
        $0.textColor = .primary
    }
    private let flowerLanguage = UILabel().then {
        $0.font = .notoSansFont(ofSize: 24, family: .regular)
    }
    private let categoryBox = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let categoryTitle = UILabel().then {
        $0.text = "다른 카테고리 보러가기"
        $0.font = .notoSansFont(ofSize: 18, family: .medium)
    }
    private let otherCategoryImg = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.image = .init(named: "Idiom")
    }
    private let otherCategoryTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
        $0.text = "오늘의 사자성어"
    }
    private let anotherCategoryImg = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.image = .init(named: "Color")
    }
    private let anotherCategoryTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .bold)
        $0.text = "오늘의 색"
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 꽃")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func bind() {
        let input = FlowerViewModel.Input(viewAppear: viewAppear.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input)

        output.flowerValue
            .subscribe(onNext: { [weak self] in
                self?.flowerImg.kf.setImage(with: $0.imageUrl)
                self?.flowerName.text = $0.name
                self?.flowerLanguage.text = $0.fairyTale
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension FlowerViewController {
    private func addSubviews() {
        [flowerImg,
         flowerName,
         flowerLanguage,
         categoryBox,
         categoryTitle,
         otherCategoryImg,
         otherCategoryTitle,
         anotherCategoryImg,
         anotherCategoryTitle].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        flowerImg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(90)
            $0.leading.trailing.equalToSuperview()
            $0.width.height.equalTo(340)
        }
        flowerName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(flowerImg.snp.bottom).offset(40)
        }
        flowerLanguage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(flowerName.snp.bottom).offset(20)
        }
        categoryBox.snp.makeConstraints {
            $0.height.equalTo(260)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        categoryTitle.snp.makeConstraints {
            $0.top.equalTo(categoryBox.snp.top).inset(21)
            $0.centerX.equalToSuperview()
        }
        otherCategoryImg.snp.makeConstraints {
            $0.top.equalTo(categoryTitle.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(165)
        }
        otherCategoryTitle.snp.makeConstraints {
            $0.top.equalTo(otherCategoryImg).inset(5)
            $0.leading.equalTo(otherCategoryImg.snp.leading).inset(33)
        }
        anotherCategoryImg.snp.makeConstraints {
            $0.centerY.equalTo(otherCategoryImg.snp.centerY)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.height.equalTo(165)
        }
        anotherCategoryTitle.snp.makeConstraints {
            $0.centerY.equalTo(otherCategoryTitle.snp.centerY)
            $0.trailing.equalToSuperview().inset(64)
        }
    }
}
