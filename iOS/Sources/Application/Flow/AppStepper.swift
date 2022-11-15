import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class AppStepper: Stepper {

    private let refreshTokenUseCase: RefreshTokenUseCase

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    init() {
        self.refreshTokenUseCase = AuthDependency.resolve().refreshTokenUseCase
    }

    func readyToEmitSteps() {
        refreshTokenUseCase.excute()
            .andThen(Single.just(TodayStep.mainIsRequired))
            .asObservable()
            .catchAndReturn(TodayStep.onboarindIsRequired)
            .bind(to: steps)
            .disposed(by: disposeBag)
    }

}
