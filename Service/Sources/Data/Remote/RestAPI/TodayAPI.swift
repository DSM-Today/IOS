import Foundation

import Moya

protocol TodayAPI: TargetType {
    var domain: Domain { get }
    var urlPath: String { get }
}

extension TodayAPI {

    var baseURL: URL { URL(string: "http://3.38.110.184:8000")! }

    var path: String {
        return domain.uri + urlPath
    }

    var task: Task { .requestPlain }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}

enum Domain: String {
    case today
}

extension Domain {
    var uri: String {
        return "\(self.rawValue)"
    }
}
