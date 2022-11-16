import Foundation

struct RandomSubjectListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "random_subject_list"
    }
    let list: [SubjectResponse]
}

extension RandomSubjectListResponse {
    func toDomain() -> [Subject] {
        return list.map { $0.toDomain() }
    }
}
