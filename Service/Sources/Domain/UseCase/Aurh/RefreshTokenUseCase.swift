import Foundation

import RxSwift

public class RefreshTokenUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        return repository.refreshToken()
    }

}
