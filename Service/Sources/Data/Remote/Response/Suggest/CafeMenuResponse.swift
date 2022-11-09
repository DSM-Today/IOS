import Foundation

struct CafeMenuResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case price
        case reason
        case imagePath = "image_path"
    }
    let name: String
    let price: String
    let reason: String
    let imagePath: String
}

extension CafeMenuResponse {
    func toDomain() -> CafeMenu {
        return .init(
            name: name,
            price: price,
            reason: reason,
            imageUrl: URL(string: imagePath)!
        )
    }
}
