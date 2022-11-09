import Foundation

import RxSwift

protocol SuggestRemoteDataSource: RemoteDataSource<SuggestAPI> {
    func fetchSuggestList() -> Single<[Subject]>
    func fetchTodoList() -> Single<[Todo]>
    func fetchBook() -> Single<Book>
    func bookmarkBook() -> Completable
    func deleteBookmarkBook() -> Completable
    func fetchMovie() -> Single<Movie>
    func bookmarkMovie() -> Completable
    func deleteBookmarkMovie() -> Completable
    func fetchMusic() -> Single<Music>
    func bookmarkMusic() -> Completable
    func deleteBookmarkMusic() -> Completable
    func fetchWebtoon() -> Single<Webtoon>
    func bookmarkWebtoon() -> Completable
    func deleteBookmarkWebtoon() -> Completable
    func fetchFood() -> Single<Food>
    func bookmarkFood() -> Completable
    func deleteBookmarkFood() -> Completable
    func fetchCafeMenu() -> Single<CafeMenu>
    func bookmarkCafeMenu() -> Completable
    func deleteBookmarkCafeMenu() -> Completable
}
