import Foundation

import RxSwift

public struct BookmarkServiceDependency {
    public let postBookmarkUseCase: PostBookmarkUseCase
    public let deleteBookmarkUseCase: DeleteBookmarkUseCase
}

public extension BookmarkServiceDependency {

    static func resolve() -> BookmarkServiceDependency {

        let remoteDataSource = BookarmkRemoteDataSourceImpl()
        let repository = BookmarkRepositoryImpl(
            remoteDataSource: remoteDataSource
        )

        let postBookmarkUseCase = PostBookmarkUseCase(
            repository: repository
        )
        let deletBookmarkUseCase = DeleteBookmarkUseCase(
            repository: repository
        )

        return .init(
            postBookmarkUseCase: postBookmarkUseCase,
            deleteBookmarkUseCase: deletBookmarkUseCase
        )
    }
}
