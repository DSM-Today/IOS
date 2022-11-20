import Foundation

import RxSwift

protocol RandomRepository {
    func fetchRandomList() -> Observable<[Subject]>
    func fetchFlower() -> Single<Flower>
    func fetchLucky() -> Single<Lucky>
    func fetchQuiz() -> Single<Quiz>
    func fetchIdiom() -> Single<Idiom>
    func fetchCharacter() -> Single<Character>
}
