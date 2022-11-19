import Foundation

struct BookmarkSubjectResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name = "subject_name"
        case title = "subject_title"
        case amount
    }
    let name: String
    let title: String
    let amount: Int
}

extension BookmarkSubjectResponse {
    func toDomain() -> BookmarkSubject {
        return .init(
            name: name,
            title: title,
            amount: amount
        )
    }
}
