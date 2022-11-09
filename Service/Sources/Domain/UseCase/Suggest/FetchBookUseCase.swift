import Foundation

import RxSwift

public class FetchBookUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Book> {
        return repository.fetchBook()
    }

}
