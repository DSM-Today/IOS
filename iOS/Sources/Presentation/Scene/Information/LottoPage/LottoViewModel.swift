import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class LottoViewModel: ViewModel, Stepper {
    private let fetchLottoUseCase: FetchLottoUseCase

    init(fetchLottoUseCase: FetchLottoUseCase) {
        self.fetchLottoUseCase = fetchLottoUseCase
    }

    var steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        let lottoValue: PublishRelay<Lotto>
    }

    func transform(_ input: Input) -> Output {
        let lottoValue = PublishRelay<Lotto>()

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchLottoUseCase.excute()
            }
            .subscribe(onNext: {
                lottoValue.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(lottoValue: lottoValue)
    }
}
