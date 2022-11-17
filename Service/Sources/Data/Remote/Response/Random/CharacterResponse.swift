import Foundation

struct CharacterResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imagePath = "image_path"
        case name
        case introduce
    }
    let imagePath: String
    let name: String
    let introduce: String
}

extension CharacterResponse {
    func toDomain() -> Character {
        return .init(
            imageUrl: URL(string: imagePath)!,
            name: name,
            introduce: introduce
        )
    }
}
