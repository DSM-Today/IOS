import Foundation

import Moya

enum SuggestAPI {
    case fetchSuggestList
    case fetchTodoList
    case fetchBook
    case fetchMovie
    case fetchMusic
    case fetchWebtoon
    case fetchFood
    case fetchCafeMenu
}

extension SuggestAPI: TodayAPI {

    var domain: Domain {
        return .suggest
    }

    var urlPath: String {
        switch self {
        case .fetchSuggestList:
            return "/list"
        case .fetchTodoList:
            return "/todo/list"
        case .fetchFood:
            return "/food"
        case .fetchMovie:
            return "/movie"
        case .fetchMusic:
            return "/music"
        case .fetchWebtoon:
            return "/webtoon"
        case .fetchCafeMenu:
            return "/menu"
        default:
            return "/book"
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
