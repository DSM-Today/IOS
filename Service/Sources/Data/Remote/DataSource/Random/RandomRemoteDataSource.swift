import Foundation

import RxSwift

protocol RandomRemoteDataSource: RemoteDataSource<RandomAPI> {
    func fetchRandomList() -> Single<[Subject]>
    func fetchFlower() -> Single<Flower>
    func fetchLucky() -> Single<Lucky>
    func fetchQuiz() -> Single<Quiz>
    func completeQuiz(answer: String) -> Single<CompleteQuiz>
    func fetchQuizAnswer() -> Single<QuizAnswer>
    func fetchIdiom() -> Single<Idiom>
    func bookmarkFlower() -> Completable
    func bookmarkLucky() -> Completable
    func bookmarkQuiz() -> Completable
    func bookmarkIdiom() -> Completable
    func deleteBookmarkFlower() -> Completable
    func deleteBookmarkLucky() -> Completable
    func deleteBookmarkQuiz() -> Completable
    func deleteBookmarkIdiom() -> Completable
}