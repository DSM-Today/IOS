import Foundation

struct QuizResponse: Decodable {
    let title: String
}

extension QuizResponse {
    func toDomain() -> Quiz {
        return .init(title: title)
    }
}
