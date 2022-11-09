import Foundation

struct FlowerResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imagePath = "image_path"
        case name
        case fairyTale = "fairy_tale"
    }
    let imagePath: String
    let name: String
    let fairyTale: String
}

extension FlowerResponse {
    func toDomain() -> Flower {
        return .init(
            imageUrl: URL(string: imagePath)!,
            name: name,
            fairyTale: fairyTale
        )
    }
}
