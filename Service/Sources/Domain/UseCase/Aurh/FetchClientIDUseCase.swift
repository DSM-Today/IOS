import Foundation

import RxSwift

public class FetchClientIDUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute() -> Single<ClientID> {
        return repository.fetchClientID()
    }

}
