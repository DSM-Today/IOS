import Foundation

struct BookmarkListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "bookmark_list"
    }
    let list: [BookmarkSubjectResponse]
}

extension BookmarkListResponse {
    func toDomain() -> [BookmarkSubject] {
        return list.map { $0.toDomain() }
    }
}
