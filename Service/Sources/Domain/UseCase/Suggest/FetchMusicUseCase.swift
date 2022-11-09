import Foundation

import RxSwift

public class FetchMusicUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Music> {
        return repository.fetchMusic()
    }

}
