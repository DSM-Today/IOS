import Foundation

import RxSwift

public class FetchCafeMenuUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Single<CafeMenu> {
        return repository.fetchCafeMenu()
    }

}
