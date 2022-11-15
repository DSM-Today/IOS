import Foundation

struct MovieResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case imagePath = "image_path"
        case directUrl = "direct_url"
        case content
    }
    let title: String
    let imagePath: String
    let directUrl: String
    let content: String
}

extension MovieResponse {
    func toDomain() -> Movie {
        return .init(
            title: title,
            imageUrl: URL(string: imagePath)!,
            directUrl: URL(string: directUrl)!,
            content: content
        )
    }
}
