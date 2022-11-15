import Foundation

struct TodoResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "todo_id"
        case content
    }
    let id: String
    let content: String
}

extension TodoResponse {
    func toDomain() -> Todo {
        return .init(
            id: id,
            content: content
        )
    }
}
