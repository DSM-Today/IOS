import Foundation

struct ChatResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case content
        case imageUrlString = "image_path"
        case sender
    }
    let content: String
    let imageUrlString: String
    let sender: String
}

extension ChatResponse {
    func toDomain() -> Chat {
        return .init(
            content: content,
            imageUrl: URL(string: imageUrlString)!,
            sender: sender
        )
    }
}
