import Foundation

struct BookResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imagePath = "image_path"
        case title
        case writer
        case score
        case reviewAmount = "review_amount"
        case directUrlString = "direct_url"
        case comment
    }
    let imagePath: String
    let title: String
    let writer: String
    let score: String
    let reviewAmount: String
    let directUrlString: String
    let comment: String
}

extension BookResponse {
    func toDomain() -> Book {
        return .init(
            imageUrl: URL(string: imagePath)!,
            title: title,
            writer: writer,
            score: score,
            reviewAmount: reviewAmount,
            directUrl: URL(string: directUrlString)!,
            comment: comment
        )
    }
}
