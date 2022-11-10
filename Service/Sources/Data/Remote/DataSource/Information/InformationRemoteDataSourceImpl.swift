import Foundation

import RxSwift

final class InformationRemoteDataSourceImpl: RemoteDataSource<InformationAPI>, InformationRemoteDataSource {

    func fetchInformationList() -> Single<[Subject]> {
        return request(.fetchInformationList)
            .map(SubjectInformationListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchNews() -> Single<News> {
        return request(.fetchNews)
            .map(NewsResponse.self)
            .map { $0.toDomain() }
    }

    func fetchLotto() -> Single<Lotto> {
        return request(.fetchLotto)
            .map(LottoResponse.self)
            .map { $0.toDomain() }
    }

    func bookmarkNews() -> Completable {
        return request(.bookmarkNews)
            .asCompletable()
    }

    func bookmarkLotto() -> Completable {
        return request(.bookmarkLotto)
            .asCompletable()
    }

    func deleteBookmarkNews() -> Completable {
        return request(.deleteBookmarkNews)
            .asCompletable()
    }

    func deleteBookmarkLotto() -> Completable {
        return request(.deleteBookmarkLotto)
            .asCompletable()
    }
}
