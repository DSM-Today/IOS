import Foundation

import RxSwift

protocol InformationRemoteDataSource: RemoteDataSource<InformationAPI> {
    func fetchInformationList() -> Single<[Subject]>
    func fetchNews() -> Single<News>
    func fetchLotto() -> Single<Lotto>
    func bookmarkNews() -> Completable
    func bookmarkLotto() -> Completable
    func deleteBookmarkNews() -> Completable
    func deleteBookmarkLotto() -> Completable
}
