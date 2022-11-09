import Foundation

import RxSwift

public class FetchFlowerUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Flower> {
        return repository.fetchFlower()
    }

}
