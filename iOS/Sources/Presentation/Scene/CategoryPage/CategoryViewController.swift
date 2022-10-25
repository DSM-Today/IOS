import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class CategoryViewController: UIViewController {
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
        self.view.backgroundColor = .gray1
        self.categoryTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - Navigation
    private func setNavigation() {
        self.title = "오늘의 랜덤"
        if  let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.shadowColor = .clear
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
}

// MARK: - Layout
extension CategoryViewController {
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

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath)
                as? CategoryTableViewCell else { return UITableViewCell() }
        cell.categoryLabel.text = "오늘의 꽃"
        cell.bookMarkTitle.text = "즐겨찾기 한 사람 : 3"
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
    }
}
