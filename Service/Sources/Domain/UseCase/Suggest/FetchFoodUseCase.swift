import Foundation

import RxSwift

public class FetchFoodUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Food> {
        return repository.fetchFood()
    }

}
