import Foundation

import RxSwift

public class FetchWebtoonUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Webtoon> {
        return repository.fetchWebtoon()
    }

}
