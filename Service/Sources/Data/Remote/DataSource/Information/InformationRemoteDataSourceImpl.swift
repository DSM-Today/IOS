import Foundation

import RxSwift

final class InformationRemoteDataSourceImpl: RemoteDataSource<InformationAPI>, InformationRemoteDataSource {

    func fetchInformationList() -> Single<[Subject]> {
        return request(.fetchInformationList)
            .map(InformationSubjectListResponse.self)
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

}
