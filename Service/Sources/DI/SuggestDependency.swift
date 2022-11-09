import Foundation

import RxSwift

public struct SuggestDependency {
    public let fetchSubjectSuggestListUseCase: FetchSubjectSuggestListUseCase
    public let fetchTodoListUseCase: FetchTodoListUseCase
    public let fetchBookUseCase: FetchBookUseCase
    public let bookmarkBookUseCase: BookmarkBookUseCase
    public let deleteBookmarkBookUseCase: DeleteBookmarkBookUseCase
    public let fetchMovieUseCase: FetchMovieUseCase
    public let bookmarkMovieUseCase: BookmarkBookUseCase
    public let deleteBookmarkMovieUseCase: DeleteBookmarkMovieUseCase
    public let fetchMuiscUseCase: FetchMusicUseCase
    public let bookmarkMusicUseCase: BookmarkMusicUseCase
    public let deleteBookmarkMusicUseCase: DeleteBookmarkMusicUseCase
    public let fetchWebtoonUseCase: FetchWebtoonUseCase
    public let bookmarkWebtoonUseCase: BookmarkWebtoonUseCase
    public let deleteBookmarkWebtoonUseCase: DeleteBookmarkWebtoonUseCase
    public let fetchFoodUseCase: FetchFoodUseCase
    public let bookmarkFoodUseCase: BookmarkFoodUseCase
    public let deleteBookmarkFoodUseCase: DeleteBookmarkFoodUseCase
    public let fetchCafeMenuUseCase: FetchCafeMenuUseCase
    public let bookmarkCafeMenuUseCase: BookmarkCafeMenuUseCase
    public let deleteBookmarkCafeMenuUseCase: DeleteBookmarkCafeMenuUseCase
}

public extension SuggestDependency {
// swiftlint:disable function_body_length
    func resolve() -> SuggestDependency {

        let remoteDataSource = SuggestRemoteDataSourceImpl()
        let repository = SuggestRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchSubjectSuggestListUseCase = FetchSubjectSuggestListUseCase(
            repository: repository
        )
        let fetchTodoListUseCase = FetchTodoListUseCase(
            repository: repository
        )
        let fetchBookUseCase = FetchBookUseCase(
            repository: repository
        )
        let bookmarkBookUseCase = BookmarkBookUseCase(
            repository: repository
        )
        let deleteBookmarkBookUseCase = DeleteBookmarkBookUseCase(
            repository: repository
        )
        let fetchMovieUseCase = FetchMovieUseCase(
            reposiotry: repository
        )
        let bookmarkMovieUseCase = BookmarkMovieUseCase(
            repository: repository
        )
        let deleteBookmarkMovieUseCase = DeleteBookmarkMovieUseCase(
            repository: repository
        )
        let fetchMusicUseCase = FetchMusicUseCase(
            repository: repository
        )
        let bookmarkMusicUseCase = BookmarkMusicUseCase(
            repository: repository
        )
        let deleteBookmarkMusicUseCase = DeleteBookmarkMusicUseCase(
            repository: repository
        )
        let fetchWebtoonUseCase = FetchWebtoonUseCase(
            repository: repository
        )
        let bookmarkWebtoonUseCase = BookmarkWebtoonUseCase(
            repository: repository
        )
        let deleteBookmarkWebtoonUseCase = DeleteBookmarkWebtoonUseCase(
            repository: repository
        )
        let fetchFoodUseCase = FetchFoodUseCase(
            repository: repository
        )
        let bookmarkFoodUseCase = BookmarkFoodUseCase(
            repository: repository
        )
        let deleteBookmarkFoodUseCase = DeleteBookmarkFoodUseCase(
            repository: repository
        )
        let fetchCafeMenuUseCase = FetchCafeMenuUseCase(
            repository: repository
        )
        let bookmarkCafeMenuUseCase = BookmarkCafeMenuUseCase(
            repository: repository
        )
        let deleteBookmarkCafeMenuUseCase = DeleteBookmarkCafeMenuUseCase(
            repository: repository
        )

        return SuggestDependency(
            fetchSubjectSuggestListUseCase: fetchSubjectSuggestListUseCase,
            fetchTodoListUseCase: fetchTodoListUseCase,
            fetchBookUseCase: fetchBookUseCase,
            bookmarkBookUseCase: bookmarkBookUseCase,
            deleteBookmarkBookUseCase: deleteBookmarkBookUseCase,
            fetchMovieUseCase: fetchMovieUseCase,
            bookmarkMovieUseCase: bookmarkBookUseCase,
            deleteBookmarkMovieUseCase: deleteBookmarkMovieUseCase,
            fetchMuiscUseCase: fetchMusicUseCase,
            bookmarkMusicUseCase: bookmarkMusicUseCase,
            deleteBookmarkMusicUseCase: deleteBookmarkMusicUseCase,
            fetchWebtoonUseCase: fetchWebtoonUseCase,
            bookmarkWebtoonUseCase: bookmarkWebtoonUseCase,
            deleteBookmarkWebtoonUseCase: deleteBookmarkWebtoonUseCase,
            fetchFoodUseCase: fetchFoodUseCase,
            bookmarkFoodUseCase: bookmarkFoodUseCase,
            deleteBookmarkFoodUseCase: deleteBookmarkFoodUseCase,
            fetchCafeMenuUseCase: fetchCafeMenuUseCase,
            bookmarkCafeMenuUseCase: bookmarkCafeMenuUseCase,
            deleteBookmarkCafeMenuUseCase: deleteBookmarkCafeMenuUseCase
        )

    }
}
