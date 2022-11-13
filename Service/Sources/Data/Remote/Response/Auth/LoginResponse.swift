import Foundation

struct LoginResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case isBirthdayExist = "is_birthday_exist"
        case isCanPerson = "is_can_person"
        case isIntroduceExist = "isIntroduceExist"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
    let isBirthdayExist: Bool
    let isCanPerson: Bool
    let isIntroduceExist: Bool
    let accessToken: String
    let refreshToken: String
}

extension LoginResponse {
    func toDomain() -> LoginEntity {
        return .init(
            isBirthdayExist: isBirthdayExist,
            isCanPerson: isCanPerson,
            isIntroduceExist: isBirthdayExist
        )
    }
}
