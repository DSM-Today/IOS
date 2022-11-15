import Foundation

import RxSwift
import RxCocoa
import RxFlow

class MainViewModel: ViewModel, Stepper {

    var steps = PublishRelay<Step>()

    struct Input {
    }

    struct Output {
    }

    func transform(_ input: Input) -> Output {
        return Output()
    }

}
