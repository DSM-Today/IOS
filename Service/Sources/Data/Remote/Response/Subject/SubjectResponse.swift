import Foundation

struct SubjectResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case title
        case amount
        case isMarked = "is_marked"
    }
    let name: String
    let title: String
    let amount: Int
    let isMarked: Int
}

extension SubjectResponse {
    func toDomain() -> Subject {
        return .init(
            name: name,
            title: title,
            amount: amount,
            isMarked: isMarked == 1
        )
    }
}
