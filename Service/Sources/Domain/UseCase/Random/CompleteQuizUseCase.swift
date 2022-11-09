import Foundation

import RxSwift

public class CompleteQuizUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute(answer: String) -> Single<CompleteQuiz> {
        return repository.completeQuiz(answer: answer)
    }
}
