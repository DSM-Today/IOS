import Foundation

import Moya

enum SuggestAPI {
    case fetchSuggestList
    case addTodo(_ title: String)
    case fetchTodoList
    case fetchMyTodoList
    case deleteTodo(_ todoId: String)
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
        case .addTodo:
            return "/todo"
        case .fetchTodoList:
            return "/todo/list"
        case .fetchMyTodoList:
            return "/todo/my-list"
        case .deleteTodo(let todoId):
            return "/todo/\(todoId)"
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
        case .addTodo, .bookmarkBook, .bookmarkMusic,
                .bookmarkMovie, .bookmarkFood, .bookmarkWebtoon, .bookmarkCafeMenu:
            return .post
        case .deleteBookmarkBook, .deleteBookmarkMusic, .deleteBookmarkMovie,
                .deleteBookmarkWebtoon, .deleteBookmarkFood, .deleteBookmarkCafeMenu, .deleteTodo:
            return .delete
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .addTodo(let title):
            return .requestParameters(
                parameters: [
                    "title": title
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }
}
