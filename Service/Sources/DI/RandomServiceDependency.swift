import Foundation

import RxSwift

public struct RandomServiceDependency {
    public let fetchSubjectRandomListUseCase: FetchSubjectRandomListUseCase
    public let fetchFlowerUseCase: FetchFlowerUseCase
    public let bookmarkFlowerUseCase: BookmarkFlowerUseCase
    public let deleteBookmarkFlowerUseCase: DeleteBookmarkFlowerUseCase
    public let fetchLuckyUseCase: FetchLuckyUseCase
    public let bookmarkLuckyUseCase: BookmarkLuckyUseCase
    public let deleteBookmarkLuckyUseCase: DeleteBookmarkLuckyUseCase
    public let fetchQuizUseCase: FetchQuizUseCase
    public let bookmarkQuizUseCase: BookmarkQuizUseCase
    public let deleteBookmarkQuizUseCase: DeleteBookmarkQuizUseCase
    public let completeQuizUseCase: CompleteQuizUseCase
    public let fetchQuizAnswerUseCase: FetchQuizAnswerUseCase
    public let fetchIdiomUseCase: FetchIdiomUseCase
    public let bookmarkIdiomUseCase: BookmarkIdiomUseCase
    public let deleteBookmarkIdiomUseCase: DeleteBookmarkIdiomUseCase
    public let fetchCharacterUseCase: FetchCharacterUseCase
    public let bookmarkCharacterUseCase: BookmarkCharacterUseCase
    public let deleteBookmarkCharacterUseCase: DeleteBookmarkCharacterUseCase
}

public extension RandomServiceDependency {

    // swiftlint:disable function_body_length
    static func resolve() -> RandomServiceDependency {

        let remoteDataSource = RandomRemoteDataSourceImpl()
        let repository = RandomRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchSubjectRandomListUseCase = FetchSubjectRandomListUseCase(
            repository: repository
        )
        let fetchFlowerUseCase = FetchFlowerUseCase(
            repository: repository
        )
        let bookmarkFlowerUseCase = BookmarkFlowerUseCase(
            repository: repository
        )
        let deleteBookmarkFlowerUseCase = DeleteBookmarkFlowerUseCase(
            repository: repository
        )
        let fetchLuckyUseCase = FetchLuckyUseCase(
            repository: repository
        )
        let bookmarkLuckyUseCase = BookmarkLuckyUseCase(
            repository: repository
        )
        let deleteBookmarkLuckyUseCase = DeleteBookmarkLuckyUseCase(
            repository: repository
        )
        let fetchQuizUseCase = FetchQuizUseCase(
            repository: repository
        )
        let bookmarkQuizUseCase = BookmarkQuizUseCase(
            repository: repository
        )
        let deleteBookmarkQuizUseCase = DeleteBookmarkQuizUseCase(
            repository: repository
        )
        let completeQuizUseCase = CompleteQuizUseCase(
            repository: repository
        )
        let fetchQuizAnswerUseCase = FetchQuizAnswerUseCase(
            repository: repository
        )
        let fetchIdiomUseCase = FetchIdiomUseCase(
            repository: repository
        )
        let bookmarkIdiomUseCase = BookmarkIdiomUseCase(
            repository: repository
        )
        let deleteBookmarkIdiomUseCase = DeleteBookmarkIdiomUseCase(
            repository: repository
        )
        let fetchCharacterUseCase = FetchCharacterUseCase(
            repository: repository
        )
        let bookmarkCharacterUseCase = BookmarkCharacterUseCase(
            repository: repository
        )
        let deleteBookmarkCharacterUseCase = DeleteBookmarkCharacterUseCase(
            repository: repository
        )

        return RandomServiceDependency(
            fetchSubjectRandomListUseCase: fetchSubjectRandomListUseCase,
            fetchFlowerUseCase: fetchFlowerUseCase,
            bookmarkFlowerUseCase: bookmarkFlowerUseCase,
            deleteBookmarkFlowerUseCase: deleteBookmarkFlowerUseCase,
            fetchLuckyUseCase: fetchLuckyUseCase,
            bookmarkLuckyUseCase: bookmarkLuckyUseCase,
            deleteBookmarkLuckyUseCase: deleteBookmarkLuckyUseCase,
            fetchQuizUseCase: fetchQuizUseCase,
            bookmarkQuizUseCase: bookmarkQuizUseCase,
            deleteBookmarkQuizUseCase: deleteBookmarkQuizUseCase,
            completeQuizUseCase: completeQuizUseCase,
            fetchQuizAnswerUseCase: fetchQuizAnswerUseCase,
            fetchIdiomUseCase: fetchIdiomUseCase,
            bookmarkIdiomUseCase: bookmarkIdiomUseCase,
            deleteBookmarkIdiomUseCase: deleteBookmarkIdiomUseCase,
            fetchCharacterUseCase: fetchCharacterUseCase,
            bookmarkCharacterUseCase: bookmarkCharacterUseCase,
            deleteBookmarkCharacterUseCase: deleteBookmarkCharacterUseCase
        )
    }
}
