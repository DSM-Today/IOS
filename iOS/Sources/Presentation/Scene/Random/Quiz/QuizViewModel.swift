import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class QuizViewModel: ViewModel, Stepper {

    private let fetchQuizUseCase: FetchQuizUseCase

    init(fetchQuizUseCase: FetchQuizUseCase) {
        self.fetchQuizUseCase = fetchQuizUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()
    private var answer: String = ""

    struct Input {
        let viewAppear: Driver<Void>
        let answer: Driver<String>
        let buttonDidTap: Driver<Void>
        let answerButtonDidTap: Driver<Void>
    }

    struct Output {
        let quiz: PublishRelay<Quiz>
        let isSuccess: PublishRelay<Bool>
        let answer: PublishRelay<String>
    }

    func transform(_ input: Input) -> Output {
        let quiz = PublishRelay<Quiz>()
        let isSuccess = PublishRelay<Bool>()
        let answer = PublishRelay<String>()

        input.viewAppear
            .asObservable()
            .flatMap { self.fetchQuizUseCase.excute() }
            .subscribe(onNext: {
                self.answer = $0.answer
                quiz.accept($0)
            })
            .disposed(by: disposeBag)

        input.buttonDidTap
            .asObservable()
            .withLatestFrom(input.answer)
            .map { self.answer == $0 }
            .bind(to: isSuccess)
            .disposed(by: disposeBag)

        input.answerButtonDidTap
            .asObservable()
            .subscribe(onNext: { _ in
                answer.accept(self.answer)
            })
            .disposed(by: disposeBag)

        return Output(quiz: quiz, isSuccess: isSuccess, answer: answer)
    }
}
