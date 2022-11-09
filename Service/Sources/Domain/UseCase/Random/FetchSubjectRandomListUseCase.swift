import Foundation

import RxSwift

public class FetchSubjectRandomListUseCase {

    private let repository: RandomRepository

    init(repository: RandomRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[Subject]> {
        return repository.fetchRandomList()
    }

}
