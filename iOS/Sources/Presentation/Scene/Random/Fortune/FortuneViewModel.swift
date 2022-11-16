import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class FortuneViewModel: ViewModel, Stepper {

    private let fetchLuckyUseCase: FetchLuckyUseCase

    init(fetchLuckyUseCase: FetchLuckyUseCase) {
        self.fetchLuckyUseCase = fetchLuckyUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        let luckyValue: PublishRelay<Lucky>
    }

    func transform(_ input: Input) -> Output {
        let luckyValue = PublishRelay<Lucky>()

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchLuckyUseCase.excute()
            }
            .subscribe(onNext: {
                luckyValue.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(luckyValue: luckyValue)
    }

}
