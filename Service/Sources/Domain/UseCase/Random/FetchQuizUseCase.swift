import Foundation

import RxSwift

public class FetchQuizUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Quiz> {
        return repository.fetchQuiz()
    }

}
