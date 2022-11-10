import Foundation

struct TokenResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
    let accessToken: String
    let refreshToken: String
}
