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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray1
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 꽃")
        navigationController?.navigationBar.setBackButtonToArrow()
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
         flowerLanguage
        ].forEach { view.addSubview($0) }
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
    }
}
