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

    func bookmarkBook() -> Completable {
        return remoteDataSource.bookmarkBook()
    }

    func deleteBookmarkBook() -> Completable {
        return remoteDataSource.deleteBookmarkBook()
    }

    func fetchMovie() -> Single<Movie> {
        return remoteDataSource.fetchMovie()
    }

    func bookmarkMovie() -> Completable {
        return remoteDataSource.bookmarkMovie()
    }

    func deleteBookmarkMovie() -> Completable {
        return remoteDataSource.deleteBookmarkMovie()
    }

    func fetchMusic() -> Single<Music> {
        return remoteDataSource.fetchMusic()
    }

    func bookmarkMusic() -> Completable {
        return remoteDataSource.bookmarkMusic()
    }

    func deleteBookmarkMusic() -> Completable {
        return remoteDataSource.deleteBookmarkMusic()
    }

    func fetchWebtoon() -> Single<Webtoon> {
        return remoteDataSource.fetchWebtoon()
    }

    func bookmarkWebtoon() -> Completable {
        return remoteDataSource.bookmarkWebtoon()
    }

    func deleteBookmarkWebtoon() -> Completable {
        return remoteDataSource.deleteBookmarkWebtoon()
    }

    func fetchFood() -> Single<Food> {
        return remoteDataSource.fetchFood()
    }

    func bookmarkFood() -> Completable {
        return remoteDataSource.bookmarkFood()
    }

    func deleteBookmarkFood() -> Completable {
        return remoteDataSource.deleteBookmarkFood()
    }

    func fetchCafeMenu() -> Single<CafeMenu> {
        return remoteDataSource.fetchCafeMenu()
    }

    func bookmarkCafeMenu() -> Completable {
        return remoteDataSource.bookmarkCafeMenu()
    }

    func deleteBookmarkCafeMenu() -> Completable {
        return remoteDataSource.deleteBookmarkCafeMenu()
    }

}
