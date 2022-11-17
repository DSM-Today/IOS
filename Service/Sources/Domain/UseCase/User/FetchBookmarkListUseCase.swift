import Foundation

import RxSwift

public class FetchBookmarkListUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[BookmarkSubject]> {
        return repository.fetchBookmarkList()
    }

}
