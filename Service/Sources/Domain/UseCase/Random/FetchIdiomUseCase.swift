import Foundation

import RxSwift

public class FetchIdiomUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Idiom> {
        return repository.fetchIdiom()
    }

}
