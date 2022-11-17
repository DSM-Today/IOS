import Foundation

import RxSwift

public class FetchCharacterUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Character> {
        return repository.fetchCharacter()
    }

}
