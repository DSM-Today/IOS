import Foundation

import RxSwift

class InformationRepositoryImpl: InformationRepository {

    let remoteDataSource: InformationRemoteDataSource

    init(remoteDataSource: InformationRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchInformationList() -> Observable<[Subject]> {
        return remoteDataSource.fetchInformationList()
            .asObservable()
    }

    func fetchNews() -> Single<News> {
        return remoteDataSource.fetchNews()
    }

    func fetchLotto() -> Single<Lotto> {
        return remoteDataSource.fetchLotto()
    }

}
