import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class FlowerViewModel: ViewModel, Stepper {

    private let fetchFlowerUseCase: FetchFlowerUseCase

    init(fetchFlowerUseCase: FetchFlowerUseCase) {
        self.fetchFlowerUseCase = fetchFlowerUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        let flowerValue: PublishRelay<Flower>
    }

    func transform(_ input: Input) -> Output {
        let flowerValue = PublishRelay<Flower>()

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchFlowerUseCase.excute()
            }
            .subscribe(onNext: {
                flowerValue.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(flowerValue: flowerValue)
    }
}
