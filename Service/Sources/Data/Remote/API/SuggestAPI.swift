import Foundation

import Moya

enum SuggestAPI {
    case fetchSuggestList
    case fetchTodoList
    case fetchBook
    case bookmarkBook
    case deleteBookmarkBook
    case fetchMovie
    case bookmarkMovie
    case deleteBookmarkMovie
    case fetchMusic
    case bookmarkMusic
    case deleteBookmarkMusic
    case fetchWebtoon
    case bookmarkWebtoon
    case deleteBookmarkWebtoon
    case fetchFood
    case bookmarkFood
    case deleteBookmarkFood
    case fetchCafeMenu
    case bookmarkCafeMenu
    case deleteBookmarkCafeMenu
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
        case .fetchFood, .bookmarkFood, .deleteBookmarkFood:
            return "/food"
        case .fetchMovie, .bookmarkMovie, .deleteBookmarkMovie:
            return "/movie"
        case .fetchMusic, .bookmarkMusic, .deleteBookmarkMusic:
            return "/music"
        case .fetchWebtoon, .bookmarkWebtoon, .deleteBookmarkWebtoon:
            return "/webtoon"
        case .fetchCafeMenu, .bookmarkCafeMenu, .deleteBookmarkCafeMenu:
            return "/menu"
        default:
            return "/book"
        }
    }

    var method: Moya.Method {
        switch self {
        case .bookmarkBook, .bookmarkMusic,
                .bookmarkMovie, .bookmarkFood, .bookmarkWebtoon, .bookmarkCafeMenu:
            return .post
        case .deleteBookmarkBook, .deleteBookmarkMusic, .deleteBookmarkMovie,
                .deleteBookmarkWebtoon, .deleteBookmarkFood, .deleteBookmarkCafeMenu:
            return .delete
        default:
            return .get
        }
    }

    var erroerMapper: [Int: TodayError]? {
        return nil
    }

    var headers: [String: String]? {
        let accessToken = KeychainTask.shared.fetchAccessToken() ?? ""
        return ["Authorization": "Bearer \(accessToken)"]
    }
}
