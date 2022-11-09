import Foundation

import Moya

enum InformationAPI {
    case fetchInformationList
    case fetchNews
    case fetchLotto
    case bookmarkNews
    case bookmarkLotto
    case deleteBookmarkNews
    case deleteBookmarkLotto
}

extension InformationAPI: TodayAPI {

    var domain: Domain {
        return .information
    }

    var urlPath: String {
        switch self {
        case .fetchInformationList:
            return "/list"
        case .fetchNews, .bookmarkNews, .deleteBookmarkNews:
            return "/news"
        default:
            return "/lotto"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchInformationList, .fetchNews, .fetchLotto:
            return .get
        case .bookmarkNews, .bookmarkLotto:
            return .post
        default:
            return .delete
        }
    }

    var erroerMapper: [Int: TodayError]? {
        return nil
    }
}
