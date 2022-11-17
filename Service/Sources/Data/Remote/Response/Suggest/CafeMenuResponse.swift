import Foundation

struct CafeMenuResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case brandName = "brand_name"
        case price
        case imagePath = "image_path"
    }
    let name: String
    let brandName: String
    let price: String?
    let imagePath: String
}

extension CafeMenuResponse {
    func toDomain() -> CafeMenu {
        return .init(
            name: name,
            brandName: brandName,
            price: price ?? "",
            imageUrl: URL(string: imagePath)!
        )
    }
}
