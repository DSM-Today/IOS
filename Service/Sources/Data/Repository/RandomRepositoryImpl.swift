import Foundation

import RxSwift

class RandomRepositoryImpl: RandomRepository {

    let remoteDataSource: RandomRemoteDataSource

    init(remoteDataSource: RandomRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchRandomList() -> Observable<[Subject]> {
        return remoteDataSource.fetchRandomList()
            .asObservable()
    }

    func fetchFlower() -> Single<Flower> {
        return remoteDataSource.fetchFlower()
    }

    func fetchLucky() -> Single<Lucky> {
        return remoteDataSource.fetchLucky()
    }

    func fetchQuiz() -> Single<Quiz> {
        return remoteDataSource.fetchQuiz()
    }

    func fetchIdiom() -> Single<Idiom> {
        return remoteDataSource.fetchIdiom()
    }

    func fetchCharacter() -> Single<Character> {
        return remoteDataSource.fetchCharacter()
    }

}
