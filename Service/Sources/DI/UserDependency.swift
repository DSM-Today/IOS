import Foundation

import RxSwift

public struct UserDependency {
    public let fetchBookmarkListUseCase: FetchBookmarkListUseCase
    public let editProfileUseCase: EditProfileUseCase
    public let fetchProfileUseCase: FetchProfileUseCase
}

public extension UserDependency {

    func resolve() -> UserDependency {

        let remoteDataSource = UserRemoteDataSourceImpl()
        let repository = UserRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchBookmarkListUseCase = FetchBookmarkListUseCase(
            repository: repository
        )
        let editProfileUseCase = EditProfileUseCase(
            repository: repository
        )
        let fetchProfileUseCase = FetchProfileUseCase(
            repository: repository
        )

        return UserDependency(
            fetchBookmarkListUseCase: fetchBookmarkListUseCase,
            editProfileUseCase: editProfileUseCase,
            fetchProfileUseCase: fetchProfileUseCase
        )
    }
}
