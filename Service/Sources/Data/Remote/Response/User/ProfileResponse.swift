import Foundation

struct ProfileResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imagePath = "image_path"
        case name
        case introduce = "introduction"
        case birthDay = "birth_day"
    }
    let imagePath: String
    let name: String
    let introduce: String
    let birthDay: String
}

extension ProfileResponse {
    func toDomain() -> Profile {
        return .init(
            imageUrl: URL(string: imagePath)!,
            name: name,
            introduce: introduce,
            birthDay: birthDay.toDate(format: "yyyy-MM-dd")
        )
    }
}
