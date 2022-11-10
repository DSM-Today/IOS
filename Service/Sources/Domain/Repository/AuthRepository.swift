import Foundation

import RxSwift

protocol AuthRepository {
    func fetchClientID() -> Single<ClientID>
    func googleLogin(idToken: String) -> Completable
    func refreshToken() -> Completable
}
