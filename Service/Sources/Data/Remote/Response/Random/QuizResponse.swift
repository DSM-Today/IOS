import Foundation

struct QuizResponse: Decodable {
    let level: String
    let question: String
    let answer: String
}

extension QuizResponse {
    func toDomain() -> Quiz {
        return .init(
            level: level,
            question: question,
            answer: answer
        )
    }
}
