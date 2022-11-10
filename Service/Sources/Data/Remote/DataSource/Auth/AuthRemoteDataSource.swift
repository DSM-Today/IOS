import Foundation

import RxSwift

protocol AuthRemoteDataSource: RemoteDataSource<AuthAPI> {
    func fetchClientID() -> Single<ClientID>
    func googleLogin(idToken: String) -> Single<TokenResponse>
    func refreshToken() -> Single<TokenResponse>
}
