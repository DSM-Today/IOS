import Foundation

struct TodoListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "todo_list"
    }
    let list: [TodoResponse]
}

extension TodoListResponse {
    func toDomain() -> [Todo] {
        return list.map { $0.toDomain() }
    }
}
