import Foundation

struct FoodResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case imagePath = "image_path"
    }
    let name: String
    let imagePath: String
}

extension FoodResponse {
    func toDomain() -> Food {
        return .init(
            name: name,
            imageUrl: URL(string: imagePath)!
        )
    }
}
