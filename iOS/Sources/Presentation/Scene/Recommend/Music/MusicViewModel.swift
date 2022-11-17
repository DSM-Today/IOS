import Foundation

import RxCocoa
import RxFlow
import RxSwift
import Service

class MusicViewModel: ViewModel, Stepper {

    var steps = PublishRelay<Step>()

    private let fetchMusicUseCase: FetchMusicUseCase

    init(fetchMusicUseCase: FetchMusicUseCase) {
        self.fetchMusicUseCase = fetchMusicUseCase
    }

    struct Input {
        let getData: Driver<Void>
        let goButtonDidTap: Driver<Void>
    }

    struct Output {
        let music: PublishRelay<Music>
    }

    private var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        let music = PublishRelay<Music>()

        input.getData.asObservable().flatMap {
            self.fetchMusicUseCase.excute()
        }.subscribe(onNext: {
            music.accept($0)
        }).disposed(by: disposeBag)

        input.goButtonDidTap.asObservable()
            .map { TodayStep.musicIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)

        return Output(
            music: music
        )
    }
}
