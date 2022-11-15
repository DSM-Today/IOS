import Foundation

class SubjectInformationListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case list = "subject_information_list"
    }
    let list: [SubjectResponse]
}

extension SubjectInformationListResponse {
    func toDomain() -> [Subject] {
        return list.map { $0.toDomain() }
    }
}
