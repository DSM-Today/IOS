import Foundation

struct TodoResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case content
        case isMyTodo = "is_my_todo"
    }
    let id: String
    let content: String
    let isMyTodo: Int
}

extension TodoResponse {
    func toDomain() -> Todo {
        return .init(
            id: id,
            content: content,
            isMyTodo: isMyTodo == 1
        )
    }
}
