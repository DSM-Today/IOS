import Foundation

struct SuggestSubjectListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "suggest_subject_list"
    }
    let list: [SubjectResponse]
}

extension SuggestSubjectListResponse {
    func toDomain() -> [Subject] {
        return list.map { $0.toDomain() }
    }
}
