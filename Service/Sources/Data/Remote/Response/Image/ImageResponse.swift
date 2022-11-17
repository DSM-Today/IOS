import Foundation

struct ImageResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imageUrlString = "image_path"
    }
    let imageUrlString: String
}

extension ImageResponse {
    func toDomain() -> Image {
        return .init(imageUrlString: imageUrlString)
    }
}
