import Foundation

import RxSwift

public class DeleteBookmarkCharacterUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        return repository.deleteBookmarkCharacter()
    }

}
