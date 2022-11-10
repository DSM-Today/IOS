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

    func googleLogin(idToken: String) -> Completable {
        return remoteDataSource.googleLogin(idToken: idToken)
            .map {
                self.keychainTask.registerAccessToken($0.accessToken)
                self.keychainTask.registerRefreshToken($0.refreshToken)
            }
            .asCompletable()
    }

    func refreshToken() -> Completable {
        return remoteDataSource.refreshToken()
            .map {
                self.keychainTask.registerAccessToken($0.accessToken)
                self.keychainTask.registerRefreshToken($0.refreshToken)
            }
            .asCompletable()
    }

}
