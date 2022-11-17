import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class FortuneViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: FortuneViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()

    // MARK: - UI
    private let fortuneImg = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 50
    }
    private let fortuneName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 24, family: .bold)
    }
    private let birthDeadline = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let explainBox = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let explainTextView = UITextView().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        self.view.backgroundColor = .gray1
        self.explainTextView.isEditable = false
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 운세")
        viewAppear.accept(())
        navigationController?.navigationBar.setBackButtonToArrow()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Bind
    private func bind() {
        let input = FortuneViewModel.Input(viewAppear: viewAppear.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input)

        output.luckyValue
            .subscribe(onNext: { [weak self] in
                self?.fortuneImg.kf.setImage(with: $0.imageUrl)
                self?.fortuneName.text = $0.luckyType
                self?.birthDeadline.text = "\($0.start.toString(format: "MM.dd")) ~ \($0.end.toString(format: "MM.dd"))"
                self?.explainTextView.text = $0.content
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension FortuneViewController {
    private func addSubviews() {
        [fortuneImg,
         fortuneName,
         birthDeadline,
         explainBox,
         explainTextView].forEach { view.addSubview($0)}
    }
    private func makeSubviewConstraints() {
        fortuneImg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(140)
            $0.width.height.equalTo(185)
        }
        fortuneName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fortuneImg.snp.bottom).offset(30)
        }
        birthDeadline.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fortuneName.snp.bottom).offset(10)
        }
        explainBox.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        explainTextView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(340)
        }
    }
}
