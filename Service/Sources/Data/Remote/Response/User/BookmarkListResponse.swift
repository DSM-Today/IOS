import Foundation

struct BookmarkListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "bookmark_list"
    }
    let list: [SubjectResponse]
}

extension BookmarkListResponse {
    func toDomain() -> [Subject] {
        return list.map { $0.toDomain() }
    }
}
