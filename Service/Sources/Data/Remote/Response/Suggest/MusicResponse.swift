import Foundation

struct MusicResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imagePath = "image_path"
        case situation
        case title
        case songWriter = "song_writer"
        case publishedAt = "published_at"
        case directUrl = "direct_url"
    }
    let imagePath: String
    let situation: String
    let title: String
    let songWriter: String
    let publishedAt: String
    let directUrl: String
}

extension MusicResponse {
    func toDomain() -> Music {
        let url = directUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return .init(
            imagePath: URL(string: imagePath)!,
            situation: situation,
            title: title,
            songWriter: songWriter,
            publishedAt: publishedAt.toDate(format: "yyyy-MM-dd"),
            directUrl: URL(string: url)!
        )
    }
}
