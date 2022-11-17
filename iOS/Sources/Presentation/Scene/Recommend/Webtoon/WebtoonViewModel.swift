import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class WebtoonViewModel: ViewModel, Stepper {

    private let fetchWebtoonUseCase: FetchWebtoonUseCase

    init(fetchWebtoonUseCase: FetchWebtoonUseCase) {
        self.fetchWebtoonUseCase = fetchWebtoonUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        let webtoonValue: PublishRelay<Webtoon>
    }

    func transform(_ input: Input) -> Output {
        let webtoonValue = PublishRelay<Webtoon>()

        input.viewAppear
            .asObservable()
            .flatMap { self.fetchWebtoonUseCase.excute() }
            .subscribe(onNext: {
                webtoonValue.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(webtoonValue: webtoonValue)
    }
}
