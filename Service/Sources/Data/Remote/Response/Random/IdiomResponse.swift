import Foundation

struct IdiomResponse: Decodable {
    let korean: String
    let chinese: String
    let describe: String
}

extension IdiomResponse {
    func toDomain() -> Idiom {
        return .init(
            korean: korean,
            chinese: chinese,
            describe: describe
        )
    }
}
