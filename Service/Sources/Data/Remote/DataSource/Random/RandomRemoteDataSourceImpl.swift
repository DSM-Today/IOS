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

    func completeQuiz(answer: String) -> Single<CompleteQuiz> {
        return request(.completeQuiz(answer))
            .map(CompleteQuizResponse.self)
            .map { $0.toDomain() }
    }

    func fetchQuizAnswer() -> Single<QuizAnswer> {
        return request(.fetchQuizAnswer)
            .map(QuizAnswerResponse.self)
            .map { $0.toDomain() }
    }

    func fetchIdiom() -> Single<Idiom> {
        return request(.fetchIdiom)
            .map(IdiomResponse.self)
            .map { $0.toDomain() }
    }

    func bookmarkFlower() -> Completable {
        return request(.bookmarkFlower)
            .asCompletable()
    }

    func bookmarkLucky() -> Completable {
        return request(.bookmarkLucky)
            .asCompletable()
    }

    func bookmarkQuiz() -> Completable {
        return request(.bookmarkQuiz)
            .asCompletable()
    }

    func bookmarkIdiom() -> Completable {
        return request(.bookmarkIdiom)
            .asCompletable()
    }

    func bookmarkCharacter() -> Completable {
        return request(.bookmarkCharacter)
            .asCompletable()
    }

    func deleteBookmarkFlower() -> Completable {
        return request(.deleteBookmarkFlower)
            .asCompletable()
    }

    func deleteBookmarkLucky() -> Completable {
        return request(.deleteBookmarkLucky)
            .asCompletable()
    }

    func deleteBookmarkQuiz() -> Completable {
        return request(.deleteBookmarkQuiz)
            .asCompletable()
    }

    func deleteBookmarkIdiom() -> Completable {
        return request(.deleteBookmarkIdiom)
            .asCompletable()
    }

    func deleteBookmarkCharacter() -> Completable {
        return request(.deleteBookmarkCharacter)
            .asCompletable()
    }

}
