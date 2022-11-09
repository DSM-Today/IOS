import Foundation

struct IdiomResponse: Decodable {
    let korean: String
    let chines: String
    let describe: String
}

extension IdiomResponse {
    func toDomain() -> Idiom {
        return .init(
            korean: korean,
            chinese: chines,
            describe: describe
        )
    }
}
