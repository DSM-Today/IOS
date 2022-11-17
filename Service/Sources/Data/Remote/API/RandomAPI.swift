import Foundation

import Moya

enum RandomAPI {
    case fetchRandomList
    case fetchFlower
    case fetchLucky
    case fetchQuiz
    case fetchCharacter
    case completeQuiz(_ answer: String)
    case fetchQuizAnswer
    case fetchIdiom
    case bookmarkFlower
    case bookmarkLucky
    case bookmarkQuiz
    case bookmarkIdiom
    case bookmarkCharacter
    case deleteBookmarkFlower
    case deleteBookmarkLucky
    case deleteBookmarkQuiz
    case deleteBookmarkIdiom
    case deleteBookmarkCharacter
}

extension RandomAPI: TodayAPI {

    var domain: Domain {
        return .random
    }

    var urlPath: String {
        switch self {
        case .fetchRandomList:
            return "/list"
        case .fetchFlower, .bookmarkFlower, .deleteBookmarkFlower:
            return "/flower"
        case .fetchLucky, .bookmarkLucky, .deleteBookmarkLucky:
            return "/lucky"
        case .fetchIdiom, .bookmarkIdiom, .deleteBookmarkIdiom:
            return "/lion"
        case .fetchQuiz, .bookmarkQuiz, .deleteBookmarkQuiz:
            return "/quiz"
        case .fetchQuizAnswer:
            return "/quiz/answer"
        case .fetchCharacter, .bookmarkCharacter, .deleteBookmarkCharacter:
            return "/person"
        default:
            return "/quiz/complete"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchRandomList, .fetchFlower, .fetchLucky,
                .fetchQuiz, .fetchQuizAnswer, .fetchIdiom, .fetchCharacter:
            return .get
        case .completeQuiz:
            return .put
        case .deleteBookmarkFlower, .deleteBookmarkLucky,
                .deleteBookmarkQuiz, .deleteBookmarkIdiom, .deleteBookmarkCharacter:
            return .delete
        default:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .completeQuiz(let answer):
            return .requestParameters(
                parameters: [
                    "answer": answer
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

    var headers: [String: String]? {
        let accessToken = KeychainTask.shared.fetchAccessToken() ?? ""
        return ["Authorization": "Bearer \(accessToken)"]
    }
}
