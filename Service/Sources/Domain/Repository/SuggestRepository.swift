import Foundation

import RxSwift

protocol SuggestRepository {
    func fetchSuggestList() -> Observable<[Subject]>
    func fetchTodoList() -> Single<[Todo]>
    func fetchBook() -> Single<Book>
    func fetchMovie() -> Single<Movie>
    func fetchMusic() -> Single<Music>
    func fetchWebtoon() -> Single<Webtoon>
    func fetchFood() -> Single<Food>
    func fetchCafeMenu() -> Single<CafeMenu>
}
