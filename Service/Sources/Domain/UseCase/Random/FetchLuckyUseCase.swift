import Foundation

import RxSwift

public class FetchLuckyUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Lucky> {
        return repository.fetchLucky()
    }

}
