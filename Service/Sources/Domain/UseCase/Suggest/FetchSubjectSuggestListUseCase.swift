import Foundation

import RxSwift

public class FetchSubjectSuggestListUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[Subject]> {
        return repository.fetchSuggestList()
    }

}
