import Foundation

import RxCocoa
import RxFlow
import RxSwift
import Service

class FoodViewModel: ViewModel, Stepper {

    var steps = PublishRelay<Step>()

    private let fetchFoodUseCase: FetchFoodUseCase

    init(fetchFoodUseCase: FetchFoodUseCase) {
        self.fetchFoodUseCase = fetchFoodUseCase
    }

    struct Input {
        let getData: Driver<Void>
    }

    struct Output {
        let food: PublishRelay<Food>
    }

    private var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        let food = PublishRelay<Food>()

        input.getData.asObservable().flatMap {
            self.fetchFoodUseCase.excute()
        }.subscribe(onNext: {
            food.accept($0)
        }).disposed(by: disposeBag)

        return Output(
            food: food
        )
    }
}
