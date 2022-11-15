import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class UserProfileViewModel: ViewModel, Stepper {

    private let initProfileStepUseCase: InitProfileUseCase

    init(initProfileStepUseCase: InitProfileUseCase) {
        self.initProfileStepUseCase = initProfileStepUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let introduce: Driver<String>
        let birthDay: Driver<Date>
        let canPerson: Driver<Bool>
        let completeButtonDidTap: Driver<Void>
    }

    struct Output {
    }

    func transform(_ input: Input) -> Output {
        let info = Driver.combineLatest(input.introduce, input.birthDay, input.canPerson)
        input.completeButtonDidTap
            .asObservable()
            .withLatestFrom(info.asObservable())
            .flatMap {
                self.initProfileStepUseCase.excute(introduce: $0, birthDay: $1, canPerson: $2)
                    .andThen(Single.just(TodayStep.mainIsRequired))
            }
            .bind(to: steps)
            .disposed(by: disposeBag)

        return Output()
    }
}
