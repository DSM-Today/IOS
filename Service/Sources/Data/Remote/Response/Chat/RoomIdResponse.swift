import Foundation

struct RoomIdResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case roomId = "room_id"
    }
    let roomId: String
}
