import Foundation

import RxSwift

public class FetchQuizAnswerUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute() -> Single<QuizAnswer> {
        return repository.fetchQuizAnswer()
    }

}
