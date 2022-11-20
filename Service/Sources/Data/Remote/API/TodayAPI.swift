import Foundation

import Moya

protocol TodayAPI: TargetType {
    var domain: Domain { get }
    var urlPath: String { get }
    var erroerMapper: [Int: TodayError]? { get }
}

extension TodayAPI {

    var baseURL: URL { URL(string: "http://43.201.53.240:8000")! }

    var path: String {
        return domain.uri + urlPath
    }

    var task: Task {
        return .requestPlain
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        return nil
    }
}

enum Domain: String {
    case auth
    case user
    case random
    case suggest
    case information
    case images
    case bookmarks
}

extension Domain {
    var uri: String {
        return "\(self.rawValue)"
    }
}
