import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class IdiomViewModel: ViewModel, Stepper {
    private let fetchIdiomUseCase: FetchIdiomUseCase

    init(fetchIdiomUseCase: FetchIdiomUseCase) {
        self.fetchIdiomUseCase = fetchIdiomUseCase
    }

    var steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        let idiomValue: PublishRelay<Idiom>
    }

    func transform(_ input: Input) -> Output {
        let idiomValue = PublishRelay<Idiom>()

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchIdiomUseCase.excute()
            }
            .subscribe(onNext: {
                idiomValue.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(idiomValue: idiomValue)
    }
}
