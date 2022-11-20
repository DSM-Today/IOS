import Foundation

import RxSwift

protocol SuggestRemoteDataSource: RemoteDataSource<SuggestAPI> {
    func fetchSuggestList() -> Single<[Subject]>
    func fetchTodoList() -> Single<[Todo]>
    func fetchBook() -> Single<Book>
    func fetchMovie() -> Single<Movie>
    func fetchMusic() -> Single<Music>
    func fetchWebtoon() -> Single<Webtoon>
    func fetchFood() -> Single<Food>
    func fetchCafeMenu() -> Single<CafeMenu>
}
