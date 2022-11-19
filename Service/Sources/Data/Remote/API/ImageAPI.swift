import Foundation

import Moya

enum ImageAPI {
    case postImage(_ image: Data)
}

extension ImageAPI: TodayAPI {

    var domain: Domain {
        return .images
    }

    var urlPath: String {
        return ""
    }

    var method: Moya.Method {
        return .post
    }

    var erroerMapper: [Int: TodayError]? {
        return nil
    }

    var task: Task {
        switch self {
        case .postImage(let image):
            var multiformData = [MultipartFormData]()
            multiformData.append(.init(
                provider: .data(image),
                name: "file",
                fileName: "file.jpg",
                mimeType: "file/jpg"
            ))
            return .uploadMultipart(multiformData)
        }
    }

    var headers: [String: String]? {
        let accessToken = KeychainTask.shared.fetchAccessToken() ?? ""
        return ["Authorization": "Bearer \(accessToken)"]
    }

}
