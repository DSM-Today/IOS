import Foundation

import Moya

enum UserAPI {
    case fetchBookmarkList
    case editProfile(_ request: ProfileRequest)
    case fetchProfile
}

extension UserAPI: TodayAPI {

    var domain: Domain {
        return .user
    }

    var urlPath: String {
        switch self {
        case .fetchBookmarkList:
            return "/list"
        default:
            return "/profile"
        }
    }

    var method: Moya.Method {
        switch self {
        case .editProfile:
            return .patch
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .editProfile(let request):
            return .requestJSONEncodable(request)
        default:
            return .requestPlain
        }
    }

    var erroerMapper: [Int: TodayError]? {
        return nil
    }
}
