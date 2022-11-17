import Foundation

struct MovieResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case imagePath = "image_path"
        case url = "url"
        case content
    }
    let name: String
    let imagePath: String
    let url: String
    let content: String
}

extension MovieResponse {
    func toDomain() -> Movie {
        return .init(
            title: name,
            imageUrl: URL(string: imagePath)!,
            directUrl: URL(string: url)!,
            content: content
        )
    }
}
