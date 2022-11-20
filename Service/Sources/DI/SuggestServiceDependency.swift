import Foundation

import RxSwift

public struct SuggestServiceDependency {
    public let fetchSubjectSuggestListUseCase: FetchSubjectSuggestListUseCase
    public let fetchTodoListUseCase: FetchTodoListUseCase
    public let fetchBookUseCase: FetchBookUseCase
    public let fetchMovieUseCase: FetchMovieUseCase
    public let fetchMuiscUseCase: FetchMusicUseCase
    public let fetchWebtoonUseCase: FetchWebtoonUseCase
    public let fetchFoodUseCase: FetchFoodUseCase
    public let fetchCafeMenuUseCase: FetchCafeMenuUseCase
}

public extension SuggestServiceDependency {

    static func resolve() -> SuggestServiceDependency {

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
        let fetchMovieUseCase = FetchMovieUseCase(
            reposiotry: repository
        )
        let fetchMusicUseCase = FetchMusicUseCase(
            repository: repository
        )
        let fetchWebtoonUseCase = FetchWebtoonUseCase(
            repository: repository
        )
        let fetchFoodUseCase = FetchFoodUseCase(
            repository: repository
        )
        let fetchCafeMenuUseCase = FetchCafeMenuUseCase(
            repository: repository
        )

        return SuggestServiceDependency(
            fetchSubjectSuggestListUseCase: fetchSubjectSuggestListUseCase,
            fetchTodoListUseCase: fetchTodoListUseCase,
            fetchBookUseCase: fetchBookUseCase,
            fetchMovieUseCase: fetchMovieUseCase,
            fetchMuiscUseCase: fetchMusicUseCase,
            fetchWebtoonUseCase: fetchWebtoonUseCase,
            fetchFoodUseCase: fetchFoodUseCase,
            fetchCafeMenuUseCase: fetchCafeMenuUseCase
        )

    }
}
