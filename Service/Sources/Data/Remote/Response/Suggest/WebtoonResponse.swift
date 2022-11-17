import Foundation

struct WebtoonResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case isAdult = "is_adult"
        case isWorking = "is_working"
        case directUrl = "direct_url"
        case title
        case imagePath = "image_path"
        case writer
        case comment
        case genre
    }
    let isAdult: String
    let isWorking: String
    let directUrl: String
    let title: String
    let imagePath: String
    let writer: String
    let comment: String
    let genre: String
}

extension WebtoonResponse {
    func toDomain() -> Webtoon {
        return .init(
            isAdult: isAdult,
            isWorking: isWorking,
            directUrl: URL(string: directUrl)!,
            title: title,
            imageUrl: URL(string: imagePath)!,
            writer: writer,
            comment: comment,
            genre: genre
        )
    }
}
