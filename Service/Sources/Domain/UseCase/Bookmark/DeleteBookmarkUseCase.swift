import Foundation

import RxSwift

public class DeleteBookmarkUseCase {

    private let repository: BookmarkRepository

    init(repository: BookmarkRepository) {
        self.repository = repository
    }

    public func excute(
        name: String,
        title: String,
        kind: String
    ) -> Completable {
        return repository.deleteBookmark(
            name: name,
            title: title,
            kind: kind
        )
    }
}
