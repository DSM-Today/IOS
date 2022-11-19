import Foundation

import RxSwift

public struct UserServiceDependency {
    public let fetchBookmarkListUseCase: FetchBookmarkListUseCase
    public let editProfileUseCase: EditProfileUseCase
    public let fetchProfileUseCase: FetchProfileUseCase
    public let initProfileUseCase: InitProfileUseCase
}

public extension UserServiceDependency {

    static func resolve() -> UserServiceDependency {

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
        let initProfileUseCase = InitProfileUseCase(
            repository: repository
        )

        return UserServiceDependency(
            fetchBookmarkListUseCase: fetchBookmarkListUseCase,
            editProfileUseCase: editProfileUseCase,
            fetchProfileUseCase: fetchProfileUseCase,
            initProfileUseCase: initProfileUseCase
        )
    }
}
