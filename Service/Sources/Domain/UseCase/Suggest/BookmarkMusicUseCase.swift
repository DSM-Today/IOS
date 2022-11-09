import Foundation

import RxSwift

public class BookmarkMusicUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        return repository.bookmarkMusic()
    }

}
