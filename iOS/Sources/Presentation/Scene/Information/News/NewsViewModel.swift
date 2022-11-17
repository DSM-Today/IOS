import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class NewsViewModel: ViewModel, Stepper {
    private let fetchNewsUseCase: FetchNewsUseCase

    init(fetchNewsUseCase: FetchNewsUseCase) {
        self.fetchNewsUseCase = fetchNewsUseCase
    }

    var steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        var newsValue: PublishRelay<News>
    }

    func transform(_ input: Input) -> Output {
        let newsValue = PublishRelay<News>()

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchNewsUseCase.excute()
            }
            .subscribe(onNext: {
                newsValue.accept($0)
            })
            .disposed(by: disposeBag)
        return Output(newsValue: newsValue)
    }
}
