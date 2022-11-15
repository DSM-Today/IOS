import Foundation

struct ClientIDResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
    }
    let clientID: String
}

extension ClientIDResponse {
    func toDomain() -> ClientID {
        return .init(
            clientID: clientID
        )
    }
}
