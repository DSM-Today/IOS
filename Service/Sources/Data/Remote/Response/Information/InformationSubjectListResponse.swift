import Foundation

class InformationSubjectListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "information_subject_list"
    }
    let list: [SubjectResponse]
}

extension InformationSubjectListResponse {
    func toDomain() -> [Subject] {
        return list.map { $0.toDomain() }
    }
}
