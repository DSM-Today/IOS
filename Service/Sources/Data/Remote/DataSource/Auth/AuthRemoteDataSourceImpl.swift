import Foundation

import RxSwift

final class AuthRemoteDataSourceImpl: RemoteDataSource<AuthAPI>, AuthRemoteDataSource {

    func fetchClientID() -> Single<ClientID> {
        return request(.fetchClientID)
            .map(ClientIDResponse.self)
            .map { $0.toDomain() }
    }

    func googleLogin(idToken: String) -> Single<TokenResponse> {
        return request(.googleLogin(idToken: idToken))
            .map(TokenResponse.self)
    }

    func refreshToken() -> Single<TokenResponse> {
        return request(.refreshToken)
            .map(TokenResponse.self)
    }

}
