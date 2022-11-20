import Foundation

import RxSwift

public class PostBookmarkUseCase {

    private let repository: BookmarkRepository

    init(repository: BookmarkRepository) {
        self.repository = repository
    }

    public func excute(
        name: String,
        title: String,
        kind: String
    ) -> Completable {
        return repository.postBookmark(
            name: name,
            title: title,
            kind: kind
        )
    }
}
