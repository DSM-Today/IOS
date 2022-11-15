import Foundation

import RxSwift

public class InitProfileUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(
        introduce: String,
        birthDay: Date,
        canPerson: Bool
    ) -> Completable {
        return repository.initProfile(initProfileRequest: .init(
            introduce: introduce,
            birthDay: birthDay.toString(),
            canPerson: canPerson
        ))
    }
}
