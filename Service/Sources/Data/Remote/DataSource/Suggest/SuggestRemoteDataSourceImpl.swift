import Foundation

import RxSwift

final class SuggestRemoteDataSourceImpl: RemoteDataSource<SuggestAPI>, SuggestRemoteDataSource {

    func fetchSuggestList() -> Single<[Subject]> {
        return request(.fetchSuggestList)
            .map(SuggestSubjectListResponse.self)
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

    func fetchMovie() -> Single<Movie> {
        return request(.fetchMovie)
            .map(MovieResponse.self)
            .map { $0.toDomain() }
    }

    func fetchMusic() -> Single<Music> {
        return request(.fetchMusic)
            .map(MusicResponse.self)
            .map { $0.toDomain() }
    }

    func fetchWebtoon() -> Single<Webtoon> {
        return request(.fetchWebtoon)
            .map(WebtoonResponse.self)
            .map { $0.toDomain() }
    }

    func fetchFood() -> Single<Food> {
        return request(.fetchFood)
            .map(FoodResponse.self)
            .map { $0.toDomain() }
    }

    func fetchCafeMenu() -> Single<CafeMenu> {
        return request(.fetchCafeMenu)
            .map(CafeMenuResponse.self)
            .map { $0.toDomain() }
    }

}
