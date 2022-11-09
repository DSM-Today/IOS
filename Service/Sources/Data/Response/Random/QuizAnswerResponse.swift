import Foundation

struct QuizAnswerResponse: Decodable {
    let answer: String
}

extension QuizAnswerResponse {
    func toDomain() -> QuizAnswer {
        return .init(answer: answer)
    }
}
