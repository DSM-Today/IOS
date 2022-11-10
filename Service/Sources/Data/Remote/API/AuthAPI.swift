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
            return "/refresh"
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
}
