import Foundation

import Moya

enum UserAPI {
    case fetchBookmarkList
    case editProfile(_ request: ProfileRequest)
    case fetchProfile
    case initProfile(_ request: InitProfileRequest)
}

extension UserAPI: TodayAPI {

    var domain: Domain {
        return .user
    }

    var urlPath: String {
        switch self {
        case .fetchBookmarkList:
            return "/list"
        case .initProfile:
            return "/profile/init"
        default:
            return "/profile"
        }
    }

    var method: Moya.Method {
        switch self {
        case .editProfile, .initProfile:
            return .patch
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .editProfile(let request):
            return .requestJSONEncodable(request)
        case .initProfile(let request):
            return .requestJSONEncodable(request)
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
