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

    func completeQuiz(answer: String) -> Single<CompleteQuiz> {
        return remoteDataSource.completeQuiz(answer: answer)
    }

    func fetchQuizAnswer() -> Single<QuizAnswer> {
        return remoteDataSource.fetchQuizAnswer()
    }

    func fetchIdiom() -> Single<Idiom> {
        return remoteDataSource.fetchIdiom()
    }

    func fetchCharacter() -> Single<Character> {
        return remoteDataSource.fetchCharacter()
    }

    func bookmarkFlower() -> Completable {
        return remoteDataSource.bookmarkFlower()
    }

    func bookmarkLucky() -> Completable {
        return remoteDataSource.bookmarkLucky()
    }

    func bookmarkQuiz() -> Completable {
        return remoteDataSource.bookmarkQuiz()
    }

    func bookmarkIdiom() -> Completable {
        return remoteDataSource.bookmarkIdiom()
    }

    func bookmarkCharacter() -> Completable {
        return remoteDataSource.bookmarkCharacter()
    }

    func deleteBookmarkFlower() -> Completable {
        return remoteDataSource.deleteBookmarkFlower()
    }

    func deleteBookmarkLucky() -> Completable {
        return remoteDataSource.deleteBookmarkLucky()
    }

    func deleteBookmarkQuiz() -> Completable {
        return remoteDataSource.deleteBookmarkQuiz()
    }

    func deleteBookmarkIdiom() -> Completable {
        return remoteDataSource.deleteBookmarkIdiom()
    }

    func deleteBookmarkCharacter() -> Completable {
        return remoteDataSource.deleteBookmarkCharacter()
    }

}
