import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class InformationCategoryViewController: UIViewController {

    // MARK: - ViewModel
    var viewModel: InformationCategoryViewModel!

    private let viewAppear = PublishRelay<Void>()
    private var disposeBag = DisposeBag()

    // MARK: - UI
    private let categoryTableView = UITableView().then {
        $0.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        $0.backgroundColor = .gray1
        $0.rowHeight = 110
        $0.separatorStyle = .none
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 정보")
        navigationController?.navigationBar.setBackButtonToArrow()
        viewAppear.accept(())
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Bind
    private func bind() {
        let input = InformationCategoryViewModel.Input(
            viewAppear: viewAppear.asDriver(onErrorJustReturn: ()),
            index: categoryTableView.rx.itemSelected.asDriver()
        )

        let output = viewModel.transform(input)

        output.subjectList.bind(to: categoryTableView.rx.items(
            cellIdentifier: "cell",
            cellType: CategoryTableViewCell.self)
        ) { _, items, cell in
            cell.setData(items)
        }
        .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension InformationCategoryViewController {
    private func addSubviews() {
        view.addSubview(categoryTableView)
    }
    private func makeSubviewConstraints() {
        categoryTableView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).inset(12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}
