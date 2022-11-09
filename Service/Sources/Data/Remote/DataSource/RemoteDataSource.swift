import Foundation

import Moya
import RxMoya
import RxSwift

class RemoteDataSource<API: TodayAPI> {

    private let provider = MoyaProvider<API>()

    func request(_ api: API) -> Single<Response> {
        return provider.rx.request(api)
            .catch { error in
                guard let errorCode = (error as? MoyaError)?.response?.statusCode else {
                    return Single.error(error)
                }
                return Single.error(api.erroerMapper?[errorCode] ?? error)
            }
    }
}
