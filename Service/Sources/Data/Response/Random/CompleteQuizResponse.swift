import Foundation

struct CompleteQuizResponse: Decodable {
    let result: Bool
    let comment: String
}

extension CompleteQuizResponse {
    func toDomain() -> CompleteQuiz {
        return .init(
            result: result,
            comment: comment
        )
    }
}
