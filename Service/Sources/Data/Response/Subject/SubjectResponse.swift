import Foundation

struct SubjectResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case subject
        case bookmarkAmount = "bookmark_amount"
    }
    let subject: String
    let bookmarkAmount: Int
}

extension SubjectResponse {
    func toDomain() -> Subject {
        return .init(
            subject: subject,
            bookmarkAmount: bookmarkAmount
        )
    }
}
