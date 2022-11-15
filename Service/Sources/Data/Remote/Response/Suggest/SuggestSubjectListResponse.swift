import Foundation

struct SubjectSuggestListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "subject_suggest_list"
    }
    let list: [SubjectResponse]
}

extension SubjectSuggestListResponse {
    func toDomain() -> [Subject] {
        return list.map { $0.toDomain() }
    }
}
