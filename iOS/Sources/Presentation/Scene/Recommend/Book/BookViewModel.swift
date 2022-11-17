import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class BookViewModel: ViewModel, Stepper {
    private let fetchBookUseCase: FetchBookUseCase

    init(fetchBookUseCase: FetchBookUseCase) {
        self.fetchBookUseCase = fetchBookUseCase
    }

    var steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }
    struct Output {
        let bookValue: PublishRelay<Book>
    }

    func transform(_ input: Input) -> Output {
        let bookValue = PublishRelay<Book>()

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchBookUseCase.excute()
            }
            .subscribe(onNext: {
                bookValue.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(bookValue: bookValue)
    }
}
