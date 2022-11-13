import Foundation

import RxSwift

protocol AuthRemoteDataSource: RemoteDataSource<AuthAPI> {
    func fetchClientID() -> Single<ClientID>
    func googleLogin(idToken: String) -> Single<LoginResponse>
    func refreshToken() -> Single<LoginResponse>
}
