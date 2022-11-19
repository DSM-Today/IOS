import Foundation

struct LuckyResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case imagePath = "image_path"
        case startAt = "start_at"
        case endAt = "end_at"
        case content
    }
    let name: String
    let imagePath: String
    let startAt: String
    let endAt: String
    let content: String
}

extension LuckyResponse {
    func toDomain() -> Lucky {
        return .init(
            name: name,
            imageUrl: URL(string: imagePath)!,
            startAt: startAt.toDate(format: "MM-dd"),
            endAt: endAt.toDate(format: "MM-dd"),
            content: content
        )
    }
}
