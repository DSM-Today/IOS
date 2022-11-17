import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class MovieViewModel: ViewModel, Stepper {

    private let fetchMovieUseCase: FetchMovieUseCase

    init(fetchMovieUseCase: FetchMovieUseCase) {
        self.fetchMovieUseCase = fetchMovieUseCase
    }

    var steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        let movieValue: PublishRelay<Movie>
    }

    func transform(_ input: Input) -> Output {
        let movieValue = PublishRelay<Movie>()

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchMovieUseCase.excute()
            }
            .subscribe(onNext: {
                movieValue.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(movieValue: movieValue)
    }
}
