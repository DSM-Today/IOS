import Foundation

import RxSwift

class AuthRepositoryImpl: AuthRepository {

    let keychainTask = KeychainTask.shared
    let remoteDataSource: AuthRemoteDataSource

    init(remoteDataSource: AuthRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchClientID() -> Single<ClientID> {
        return remoteDataSource.fetchClientID()
    }

    func googleLogin(idToken: String) -> Single<LoginEntity> {
        return remoteDataSource.googleLogin(idToken: idToken)
            .map {
                self.keychainTask.registerAccessToken($0.accessToken)
                self.keychainTask.registerRefreshToken($0.refreshToken)
                return $0.toDomain()
            }
    }

    func refreshToken() -> Completable {
        return remoteDataSource.refreshToken()
            .map {
                self.keychainTask.registerAccessToken($0.accessToken)
                self.keychainTask.registerRefreshToken($0.refreshToken)
            }
            .asCompletable()
    }

    func logout() -> Completable {
        return Single.just(self.keychainTask.deleteToken())
            .asCompletable()
    }
}
