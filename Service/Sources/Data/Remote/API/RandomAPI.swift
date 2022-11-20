import Foundation

import Moya

enum RandomAPI {
    case fetchRandomList
    case fetchFlower
    case fetchLucky
    case fetchQuiz
    case fetchCharacter
    case fetchIdiom
}

extension RandomAPI: TodayAPI {

    var domain: Domain {
        return .random
    }

    var urlPath: String {
        switch self {
        case .fetchRandomList:
            return "/list"
        case .fetchFlower:
            return "/flower"
        case .fetchLucky:
            return "/lucky"
        case .fetchIdiom:
            return "/lion"
        case .fetchQuiz:
            return "/quiz"
        case .fetchCharacter:
            return "/person"
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
