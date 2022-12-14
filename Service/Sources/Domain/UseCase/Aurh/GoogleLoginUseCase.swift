import Foundation

import RxSwift

public class GoogleLoginUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(idToken: String) -> Single<LoginEntity> {
        return repository.googleLogin(idToken: idToken)
    }

}
