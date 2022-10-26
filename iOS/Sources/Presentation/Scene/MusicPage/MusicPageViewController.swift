import UIKit

import SnapKit
import Then

class MusicPageViewController: UIViewController {

    // MARK: - UI
    private let musicView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 41
    }
    private let musicImageView = UIImageView().then {
        $0.image = UIImage(systemName: "music.note.house")
        $0.tintColor = .blue6
        $0.backgroundColor = .black
    }
    private let backwardView = UIImageView().then {
        $0.image = UIImage(systemName: "backward.end.fill")
        $0.tintColor = .black
    }
    private let playView = UIImageView().then {
        $0.image = UIImage(systemName: "play.fill")
        $0.tintColor = .black
    }
    private let forwardView = UIImageView().then {
        $0.image = UIImage(systemName: "forward.end.fill")
        $0.tintColor = .black
    }
    private let playbarView = UIView().then {
        $0.backgroundColor = .black
    }
    private let playbarCircleView = UIImageView().then {
        $0.image = UIImage(systemName: "circle.fill")
        $0.tintColor = .black
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray1
        musicView.layer.shadowRadius = 15
        musicView.layer.shadowColor = UIColor.black.cgColor
        musicView.layer.shadowOpacity = 0.3
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
        self.title = "오늘의 노래"
        if  let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.shadowColor = .clear
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
}

extension MusicPageViewController {
    private func addSubviews() {
        view.addSubview(musicView)
        [musicImageView].forEach { musicView.addSubview($0) }
        [playView, backwardView, forwardView, playbarView, playbarCircleView].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        musicView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(410)
        }
        musicImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        playView.snp.makeConstraints {
            $0.top.equalTo(musicView.snp.bottom).offset(70)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(30)
        }
        backwardView.snp.makeConstraints {
            $0.top.equalTo(musicView.snp.bottom).offset(70)
            $0.trailing.equalTo(playView.snp.leading).offset(-80)
            $0.width.height.equalTo(30)
        }
        forwardView.snp.makeConstraints {
            $0.top.equalTo(musicView.snp.bottom).offset(70)
            $0.leading.equalTo(playView.snp.trailing).offset(80)
            $0.width.height.equalTo(30)
        }
        playbarView.snp.makeConstraints {
            $0.top.equalTo(playView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(2)
        }
        playbarCircleView.snp.makeConstraints {
            $0.centerY.equalTo(playbarView)
            $0.leading.equalToSuperview().inset(75)
            $0.height.width.equalTo(13)
        }
    }
}
