import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {

    // MARK: - Layout

    private let scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
    }
    private let contentView = UIView()

    private let circleImage = UIImageView().then {
        $0.image = UIImage(named: "Main")
    }
    private let todoLabel = UILabel().then {
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
    }
    private let randomCategoryView = CategoryView().then {
        $0.categoryLabel.text = "랜\n덤"
    }
    private let informationCategoryView = CategoryView().then {
        $0.categoryLabel.text = "정\n보"
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray1
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
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
}

    // MARK: - Layout
    extension MainViewController {
        func addSubviews() {
            [circleImage, todoLabel, calendarImage, scrollView].forEach { view.addSubview($0) }
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
                $0.top.equalToSuperview()
                $0.centerX.equalToSuperview()
            }
            todoLabel.snp.makeConstraints {
                $0.top.equalTo(circleImage.snp.bottom).offset(31)
                $0.leading.equalToSuperview().inset(31)
            }
            calendarImage.snp.makeConstraints {
                $0.leading.equalTo(todoLabel.snp.trailing).offset(6)
                $0.centerY.equalToSuperview()
            }
        }
    }
