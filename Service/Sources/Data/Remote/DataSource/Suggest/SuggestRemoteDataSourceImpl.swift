import Foundation

import RxSwift

final class SuggestRemoteDataSourceImpl: RemoteDataSource<SuggestAPI>, SuggestRemoteDataSource {

    func fetchSuggestList() -> Single<[Subject]> {
        return request(.fetchSuggestList)
            .map(SubjectSuggestListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchTodoList() -> Single<[Todo]> {
        return request(.fetchTodoList)
            .map(TodoListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchBook() -> Single<Book> {
        return request(.fetchBook)
            .map(BookResponse.self)
            .map { $0.toDomain() }
    }

    func bookmarkBook() -> Completable {
        return request(.bookmarkBook)
            .asCompletable()
    }

    func deleteBookmarkBook() -> Completable {
        return request(.deleteBookmarkBook)
            .asCompletable()
    }

    func fetchMovie() -> Single<Movie> {
        return request(.fetchMovie)
            .map(MovieResponse.self)
            .map { $0.toDomain() }
    }

    func bookmarkMovie() -> Completable {
        return request(.bookmarkMovie)
            .asCompletable()
    }

    func deleteBookmarkMovie() -> Completable {
        return request(.deleteBookmarkMovie)
            .asCompletable()
    }

    func fetchMusic() -> Single<Music> {
        return request(.fetchMusic)
            .map(MusicResponse.self)
            .map { $0.toDomain() }
    }

    func bookmarkMusic() -> Completable {
        return request(.bookmarkMusic)
            .asCompletable()
    }

    func deleteBookmarkMusic() -> Completable {
        return request(.deleteBookmarkMusic)
            .asCompletable()
    }

    func fetchWebtoon() -> Single<Webtoon> {
        return request(.fetchWebtoon)
            .map(WebtoonResponse.self)
            .map { $0.toDomain() }
    }

    func bookmarkWebtoon() -> Completable {
        return request(.bookmarkWebtoon)
            .asCompletable()
    }

    func deleteBookmarkWebtoon() -> Completable {
        return request(.deleteBookmarkWebtoon)
            .asCompletable()
    }

    func fetchFood() -> Single<Food> {
        return request(.fetchFood)
            .map(FoodResponse.self)
            .map { $0.toDomain() }
    }

    func bookmarkFood() -> Completable {
        return request(.bookmarkFood)
            .asCompletable()
    }

    func deleteBookmarkFood() -> Completable {
        return request(.deleteBookmarkFood)
            .asCompletable()
    }

    func fetchCafeMenu() -> Single<CafeMenu> {
        return request(.fetchCafeMenu)
            .map(CafeMenuResponse.self)
            .map { $0.toDomain() }
    }

    func bookmarkCafeMenu() -> Completable {
        return request(.bookmarkCafeMenu)
            .asCompletable()
    }

    func deleteBookmarkCafeMenu() -> Completable {
        return request(.deleteBookmarkCafeMenu)
            .asCompletable()
    }

}
