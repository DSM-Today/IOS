import Foundation

import RxSwift

protocol RandomRemoteDataSource: RemoteDataSource<RandomAPI> {
    func fetchRandomList() -> Single<[Subject]>
    func fetchFlower() -> Single<Flower>
    func fetchLucky() -> Single<Lucky>
    func fetchQuiz() -> Single<Quiz>
    func fetchIdiom() -> Single<Idiom>
    func fetchCharacter() -> Single<Character>
}
