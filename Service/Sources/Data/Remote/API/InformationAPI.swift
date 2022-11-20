import Foundation

import Moya

enum InformationAPI {
    case fetchInformationList
    case fetchNews
    case fetchLotto
}

extension InformationAPI: TodayAPI {

    var domain: Domain {
        return .information
    }

    var urlPath: String {
        switch self {
        case .fetchInformationList:
            return "/list"
        case .fetchNews:
            return "/news"
        default:
            return "/lotto"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var erroerMapper: [Int: TodayError]? {
        return nil
    }

    var headers: [String: String]? {
        let accessToken = KeychainTask.shared.fetchAccessToken() ?? ""
        return ["Authorization": "Bearer \(accessToken)"]
    }
}
