import Foundation

import RxSwift

public class EditProfileUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(
        imagePath: String,
        name: String,
        introduce: String,
        birthDay: String
    ) -> Completable {
        return repository.editProfile(
            profileRequest: .init(
                imagePath: imagePath,
                name: name,
                introduce: introduce,
                birthDay: birthDay
            ))
    }

}
