import Foundation

struct ProfileRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case imagePath = "image_path"
        case name
        case introduce
        case birthDay = "birth_day"
    }
    let imagePath: String
    let name: String
    let introduce: String
    let birthDay: String
}
