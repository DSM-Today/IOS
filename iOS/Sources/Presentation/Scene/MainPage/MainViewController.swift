import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import RxGesture

class MainViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: MainViewModel!

    private var disposeBag = DisposeBag()
    private let viewAppear = PublishRelay<Void>()
    private let randomViewDidTap = PublishRelay<Void>()
    private let informationViewDidTap = PublishRelay<Void>()
    private let recommendViewDidTap = PublishRelay<Void>()

    // MARK: - UI
    private let scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
    }
    private let contentView = UIView()

    private let circleImage = UIImageView().then {
        $0.image = UIImage(named: "Main2")
    }
    private let secondCircleImage = UIImageView().then {
        $0.image = UIImage(named: "Main3")
    }
    private let todayLabel = UILabel().then {
        $0.text = "오늘의 할일"
        $0.textColor = .black
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
    }
    private let calendarImage = UIImageView().then {
        $0.image = UIImage(named: "Calendar")
        $0.contentMode = .scaleAspectFit
    }
    private let recommendCategoryView = CategoryView().then {
        $0.categoryLabel.text = "추\n천"
        $0.categoryLabel.font = .notoSansFont(ofSize: 25, family: .medium)
    }
    private let randomCategoryView = CategoryView().then {
        $0.categoryLabel.text = "랜\n덤"
        $0.categoryLabel.font = .notoSansFont(ofSize: 25, family: .medium)
    }
    private let informationCategoryView = CategoryView().then {
        $0.categoryLabel.text = "정\n보"
        $0.categoryLabel.font = .notoSansFont(ofSize: 25, family: .medium)
    }
    private let mainTableView = UITableView().then {
        $0.register(MainToDoTableViewCell.self, forCellReuseIdentifier: "MainToDoTableViewCell")
        $0.backgroundColor = .gray1
        $0.rowHeight = 80
        $0.separatorStyle = .none
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewDidTap()
        view.backgroundColor = .gray1
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewAppear.accept(())
        setNavigation()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.title = "오늘의 카테고리"
        if  let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .primary
            appearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.notoSansFont(ofSize: 20, family: .bold),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            appearance.shadowColor = .clear
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
    // MARK: - Bind
    private func bind() {
        let input = MainViewModel.Input(
            viewAppear: viewAppear.asDriver(onErrorJustReturn: ()),
            randomViewDidTap: randomViewDidTap.asDriver(onErrorJustReturn: ()),
            informationViewDidTap: informationViewDidTap.asDriver(onErrorJustReturn: ()),
            recommendViewDidTap: recommendViewDidTap.asDriver(onErrorJustReturn: ())
        )
        let output = viewModel.transform(input)

        output.todoList.bind(to: mainTableView.rx.items(
            cellIdentifier: "MainToDoTableViewCell",
            cellType: MainToDoTableViewCell.self
        )) { _, items, cell in
            cell.toDoLabel.text = items.content
        }
        .disposed(by: disposeBag)
    }
    private func viewDidTap() {
        self.randomCategoryView.rx.tapGesture()
            .asObservable()
            .subscribe(onNext: { _ in
                self.randomViewDidTap.accept(())
            })
            .disposed(by: disposeBag)
        self.informationCategoryView.rx.tapGesture()
            .asObservable()
            .subscribe(onNext: { _ in
                self.informationViewDidTap.accept(())
            })
            .disposed(by: disposeBag)
        self.recommendCategoryView.rx.tapGesture()
            .asObservable()
            .subscribe(onNext: { _ in
                self.recommendViewDidTap.accept(())
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension MainViewController {
    func addSubviews() {
        [secondCircleImage, circleImage, todayLabel, calendarImage, scrollView, mainTableView].forEach { view.addSubview($0) }
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        [recommendCategoryView, randomCategoryView, informationCategoryView].forEach { stackView.addSubview($0) }
    }

    func makeSubviewConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        recommendCategoryView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        randomCategoryView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(recommendCategoryView.snp.trailing).offset(22)
        }
        informationCategoryView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(randomCategoryView.snp.trailing).offset(22)
            $0.trailing.equalToSuperview().inset(20)
        }
        circleImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-70)
            $0.leading.equalToSuperview().inset(-30)
            $0.width.equalTo(500)
            $0.height.equalTo(400)
        }
        secondCircleImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(480)
            $0.height.equalTo(337)
        }
        todayLabel.snp.makeConstraints {
            $0.top.equalTo(circleImage.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(31)
        }
        calendarImage.snp.makeConstraints {
            $0.leading.equalTo(todayLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(40)
            $0.centerY.equalTo(todayLabel)
        }
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(todayLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview().inset(27)
            $0.bottom.equalToSuperview()
        }
    }
}
