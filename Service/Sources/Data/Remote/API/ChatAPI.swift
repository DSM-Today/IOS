import Foundation

import Moya

enum ChatAPI {
    case fetchChatMessage(roomId: Int)
}

extension ChatAPI: TodayAPI {

    var domain: Domain {
        return .chat
    }

    var urlPath: String {
        return ""
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .fetchChatMessage(let roomId):
            return .requestParameters(
                parameters: [
                    "roomId": roomId
                ],
                encoding: URLEncoding.default
            )
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
