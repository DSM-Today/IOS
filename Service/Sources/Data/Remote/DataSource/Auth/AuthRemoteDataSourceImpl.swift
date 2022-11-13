import Foundation

import RxSwift

final class AuthRemoteDataSourceImpl: RemoteDataSource<AuthAPI>, AuthRemoteDataSource {

    func fetchClientID() -> Single<ClientID> {
        return request(.fetchClientID)
            .map(ClientIDResponse.self)
            .map { $0.toDomain() }
    }

    func googleLogin(idToken: String) -> Single<LoginResponse> {
        return request(.googleLogin(idToken: idToken))
            .map(LoginResponse.self)
    }

    func refreshToken() -> Single<LoginResponse> {
        return request(.refreshToken)
            .map(LoginResponse.self)
    }

}
