import Foundation

import RxSwift

public class FetchProfileUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Profile> {
        return repository.fetchProfile()
    }

}
