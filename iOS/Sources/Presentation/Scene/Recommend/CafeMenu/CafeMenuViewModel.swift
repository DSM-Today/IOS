import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class CafeMenuViewModel: ViewModel, Stepper {
    private let fetchCafeMenuUseCase: FetchCafeMenuUseCase

    init(fetchCafeMenuUseCase: FetchCafeMenuUseCase) {
        self.fetchCafeMenuUseCase = fetchCafeMenuUseCase
    }

    var steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        var cafeMenuValue: PublishRelay<CafeMenu>
    }

    func transform(_ input: Input) -> Output {
        let cafeMenuValue = PublishRelay<CafeMenu>()

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchCafeMenuUseCase.excute()
            }
            .subscribe(onNext: {
                cafeMenuValue.accept($0)
            })
            .disposed(by: disposeBag)
        return Output(cafeMenuValue: cafeMenuValue)
    }
}
