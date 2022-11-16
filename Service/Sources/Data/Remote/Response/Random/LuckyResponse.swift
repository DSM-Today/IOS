import Foundation

struct LuckyResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imagePath = "image_path"
        case luckyType = "lucky_type"
        case start = "start_at"
        case end = "end_at"
        case content
    }
    let imagePath: String
    let luckyType: String
    let start: String
    let end: String
    let content: String
}

extension LuckyResponse {
    func toDomain() -> Lucky {
        return .init(
            imageUrl: URL(string: imagePath)!,
            luckyType: luckyType,
            start: start.toDate(format: "yyyy-MM-dd"),
            end: end.toDate(format: "yyyy-MM-dd"),
            content: content
        )
    }
}
