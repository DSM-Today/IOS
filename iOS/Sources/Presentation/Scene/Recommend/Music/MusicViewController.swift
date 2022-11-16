import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import RxFlow

class MusicViewController: UIViewController {

    var viewModel: MusicViewModel!
    private var disposeBag = DisposeBag()
    private let getData = PublishRelay<Void>()
    private let date = Date()

    // MARK: - UI
    private let situationLabel = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .medium)
        $0.text = "혼자 있고 싶을 때"
        $0.textColor = .black
    }
    private let musicView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 41
        $0.layer.shadowRadius = 15
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
    }
    private let musicImageView = UIImageView().then {
        $0.image = UIImage(systemName: "music.note.house")
        $0.tintColor = .blue6
        $0.backgroundColor = .black
    }
    private let musicTitleLabel = UILabel().then {
        $0.text = "After LIKE"
        $0.font = .notoSansFont(ofSize: 20, family: .black)
        $0.textColor = .black
    }
    private let musicComposerLabel = UILabel().then {
        $0.text = "IVE - 아이브"
        $0.font = .notoSansFont(ofSize: 16, family: .bold)
        $0.textColor = .black
    }
    private let releaseDateLabel = UILabel().then {
        $0.text = "발매일 : "
        $0.font = .notoSansFont(ofSize: 16, family: .medium)
        $0.textColor = .black
    }
    private let dateLabel = UILabel().then {
        $0.text = "2022/08/22"
        $0.font = .notoSansFont(ofSize: 16, family: .regular)
        $0.textColor = .black
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
    private let goToMusicSiteButton = UIButton(type: .system).then {
        $0.setTitle("노래 감상하러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 20, family: .medium)
        $0.backgroundColor = .blue5
        $0.layer.cornerRadius = 41
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation("오늘의 노래")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    private func bindViewModel() {
        let input = MusicViewModel.Input(
            getData: getData.asDriver(onErrorJustReturn: ()),
            goButtonDidTap: goToMusicSiteButton.rx.tap.asDriver()
        )

        let output = viewModel.transform(input)

        output.music.asObservable().subscribe(onNext: {
            self.situationLabel.text = $0.situation
//            self.musicImageView.kf.setImage(with: $0.imageUrl)
            self.musicTitleLabel.text = $0.title
            self.musicComposerLabel.text = $0.writer
            self.dateLabel.text = $0.publishedAt.toString()
        }).disposed(by: disposeBag)
    }
}

// MARK: - Layout
// swiftlint:disable function_body_length
extension MusicViewController {
    private func addSubviews() {
        view.addSubview(musicView)
        [musicImageView, musicTitleLabel, musicComposerLabel, dateLabel, releaseDateLabel]
            .forEach { musicView.addSubview($0) }
        [situationLabel, playView, backwardView,
         forwardView, playbarView, playbarCircleView, goToMusicSiteButton].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        situationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
        }
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
        musicTitleLabel.snp.makeConstraints {
            $0.top.equalTo(musicImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        musicComposerLabel.snp.makeConstraints {
            $0.top.equalTo(musicTitleLabel.snp.bottom).offset(1)
            $0.centerX.equalToSuperview()
        }
        dateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(30)
        }
        releaseDateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(dateLabel.snp.leading).inset(1)
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
        goToMusicSiteButton.snp.makeConstraints {
            $0.height.equalTo(85)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
