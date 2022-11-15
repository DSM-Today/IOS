import Foundation

struct SubjectRandomListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "subject_random_list"
    }
    let list: [SubjectResponse]
}

extension SubjectRandomListResponse {
    func toDomain() -> [Subject] {
        return list.map { $0.toDomain() }
    }
}
