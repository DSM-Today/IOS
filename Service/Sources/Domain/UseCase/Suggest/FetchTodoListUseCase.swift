import Foundation

import RxSwift

public class FetchTodoListUseCase {

    private let repository: SuggestRepository

    init(repository: SuggestRepository) {
        self.repository = repository
    }

    public func excute() -> Single<[Todo]> {
        return repository.fetchTodoList()
    }

}
