import Foundation

struct WebtoonResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case writer
        case comment
        case working
        case imagePath = "image_path"
        case genre
        case directUrl = "direct_url"
    }
    let title: String
    let writer: String
    let comment: String
    let working: String
    let imagePath: String
    let genre: String
    let directUrl: String
}

extension WebtoonResponse {
    func toDomain() -> Webtoon {
        return .init(
            title: title,
            writer: writer,
            comment: comment,
            working: working,
            imageUrl: URL(string: imagePath)!,
            genre: genre,
            directUrl: URL(string: directUrl)!
        )
    }
}
