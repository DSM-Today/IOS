import Foundation

struct InitProfileRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case introduce
        case birthDay = "birth_day"
        case canPerson = "can_person"
    }
    let introduce: String
    let birthDay: String
    let canPerson: Bool
}
