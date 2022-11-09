import Foundation

import RxSwift

public class BookmarkNewsUseCase {

    private let repository: InformationRepository

    init(repository: InformationRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        return repository.bookmarkNews()
    }

}
