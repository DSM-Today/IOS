import Foundation

import RxSwift

public class BookmarkFoodUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        return repository.bookmarkFood()
    }

}
