import Foundation

import RxSwift

public class FetchNewsUseCase {

    private let repository: InformationRepository

    init(repository: InformationRepository) {
        self.repository = repository
    }

    public func excute() -> Single<News> {
        return repository.fetchNews()
    }

}
