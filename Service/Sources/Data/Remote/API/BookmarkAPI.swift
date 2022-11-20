import Foundation

import Moya

enum BookmarkAPI {
    case postBookmark(_ name: String, _ title: String, _ kind: String)
    case deleteBookmark(_ name: String, _ title: String, _ kind: String)
}

extension BookmarkAPI: TodayAPI {

    var domain: Domain {
        .bookmarks
    }

    var urlPath: String {
        return ""
    }

    var erroerMapper: [Int: TodayError]? {
        return nil
    }

    var method: Moya.Method {
        switch self {
        case .postBookmark:
            return .post
        default:
            return .delete
        }
    }

    var task: Task {
        switch self {
        case .postBookmark(let name, let title, let kind), .deleteBookmark(let name, let title, let kind):
            return .requestParameters(
                parameters: [
                    "name": name,
                    "title": title,
                    "kind": kind
                ],
                encoding: URLEncoding.queryString
            )
        }
    }

    var headers: [String: String]? {
        let accessToken = KeychainTask.shared.fetchAccessToken() ?? ""
        return ["Authorization": "Bearer \(accessToken)"]
    }
}
