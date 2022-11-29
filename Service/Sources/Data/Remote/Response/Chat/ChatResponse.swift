import Foundation

struct ChatResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case content
        case imageUrlString = "image_path"
        case sender
        case isMine
    }
    let content: String
    let imageUrlString: String
    let sender: String
    let isMine: Bool
}

extension ChatResponse {
    func toDomain() -> Chat {
        return .init(
            content: content,
            imageUrl: URL(string: imageUrlString)!,
            sender: sender,
            isMine: isMine
        )
    }
}
