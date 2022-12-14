import Foundation

struct NewsResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case imagePath = "image_path"
        case content
        case directUrl = "direct_url"
    }
    let title: String
    let imagePath: String
    let content: String
    let directUrl: String
}

extension NewsResponse {
    func toDomain() -> News {
        return .init(
            title: title,
            imageUrl: URL(string: imagePath)!,
            content: content,
            directUrl: URL(string: directUrl)!
        )
    }
}
