import Foundation

struct MusicResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imagePath = "image_path"
        case situation
        case title
        case writer
        case publishedAt = "published_at"
        case directUrl = "direct_url"
    }
    let imagePath: String
    let situation: String
    let title: String
    let writer: String
    let publishedAt: String
    let directUrl: String
}

extension MusicResponse {
    func toDomain() -> Music {
        return .init(
            imageUrl: URL(string: imagePath)!,
            situation: situation,
            title: title,
            writer: writer,
            publishedAt: publishedAt.toDate(),
            directUrl: URL(string: directUrl)!
        )
    }
}
