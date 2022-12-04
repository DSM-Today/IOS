import Foundation

import Moya

enum AuthAPI {
    case fetchClientID
    case googleLogin(idToken: String)
    case refreshToken
}

extension AuthAPI: TodayAPI {

    var domain: Domain {
        return .auth
    }

    var urlPath: String {
        switch self {
        case .googleLogin, .fetchClientID:
            return "/oauth/google"
        case .refreshToken:
            return "/token"
        }
    }

    var task: Task {
        switch self {
        case .googleLogin(let idToken):
            return .requestParameters(
                parameters: [
                    "id_token": idToken
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }

    var erroerMapper: [Int: TodayError]? {
        return nil
    }

    var method: Moya.Method {
        switch self {
        case .fetchClientID:
            return .get
        case .refreshToken:
            return .put
        default:
            return .post
        }
    }

    var headers: [String: String]? {
        let refreshToken = KeychainTask.shared.fetchRefreshToken() ?? ""
        switch self {
        case .refreshToken:
            return ["REFRESH-TOKEN": refreshToken]
        default:
            return nil
        }
    }
}
