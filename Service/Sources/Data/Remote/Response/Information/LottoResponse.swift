import Foundation

struct LottoResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case first = "0"
        case second = "1"
        case third = "2"
        case fourth = "3"
        case fifth = "4"
        case sixth = "5"
        case seventh = "6"
        case prize
        case round
        case date
        case winningAmount = "winning_amount"
    }
    let first: String
    let second: String
    let third: String
    let fourth: String
    let fifth: String
    let sixth: String
    let seventh: String
    let prize: String
    let round: String
    let date: String
    let winningAmount: String
}

extension LottoResponse {
    func toDomain() -> Lotto {
        return .init(
            first: first,
            second: second,
            third: third,
            fourth: fourth,
            fifth: fifth,
            sixth: sixth,
            seventh: seventh,
            prize: prize,
            round: round,
            date: date.toDate(),
            winningAmount: winningAmount
        )
    }
}
