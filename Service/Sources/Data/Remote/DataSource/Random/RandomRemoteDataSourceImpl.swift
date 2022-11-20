import Foundation

import RxSwift

final class RandomRemoteDataSourceImpl: RemoteDataSource<RandomAPI>, RandomRemoteDataSource {

    func fetchRandomList() -> Single<[Subject]> {
        return request(.fetchRandomList)
            .map(RandomSubjectListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchFlower() -> Single<Flower> {
        return request(.fetchFlower)
            .map(FlowerResponse.self)
            .map { $0.toDomain() }
    }

    func fetchLucky() -> Single<Lucky> {
        return request(.fetchLucky)
            .map(LuckyResponse.self)
            .map { $0.toDomain() }
    }

    func fetchQuiz() -> Single<Quiz> {
        return request(.fetchQuiz)
            .map(QuizResponse.self)
            .map { $0.toDomain() }
    }

    func fetchCharacter() -> Single<Character> {
        return request(.fetchCharacter)
            .map(CharacterResponse.self)
            .map { $0.toDomain() }
    }

    func fetchIdiom() -> Single<Idiom> {
        return request(.fetchIdiom)
            .map(IdiomResponse.self)
            .map { $0.toDomain() }
    }

}
