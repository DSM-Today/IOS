import Foundation

struct ChatListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "chatting_list"
    }
    let list: [ChatResponse]
}

extension ChatListResponse {
    func toDomain() -> [Chat] {
        return list.map { $0.toDomain() }
    }
}
