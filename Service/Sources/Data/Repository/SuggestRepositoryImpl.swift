import Foundation

import RxSwift

class SuggestRepositoryImpl: SuggestRepository {

    let remoteDataSource: SuggestRemoteDataSource

    init(remoteDataSource: SuggestRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchSuggestList() -> Observable<[Subject]> {
        return remoteDataSource.fetchSuggestList()
            .asObservable()
    }

    func fetchTodoList() -> Single<[Todo]> {
        return remoteDataSource.fetchTodoList()
    }

    func fetchBook() -> Single<Book> {
        return remoteDataSource.fetchBook()
    }

    func fetchMovie() -> Single<Movie> {
        return remoteDataSource.fetchMovie()
    }

    func fetchMusic() -> Single<Music> {
        return remoteDataSource.fetchMusic()
    }

    func fetchWebtoon() -> Single<Webtoon> {
        return remoteDataSource.fetchWebtoon()
    }

    func fetchFood() -> Single<Food> {
        return remoteDataSource.fetchFood()
    }

    func fetchCafeMenu() -> Single<CafeMenu> {
        return remoteDataSource.fetchCafeMenu()
    }

}
