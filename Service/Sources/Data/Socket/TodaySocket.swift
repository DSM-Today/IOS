import Foundation

enum TodaySocket {
    case connectResponse
    case message(roomId: Int, data: String)
}

extension TodaySocket {

    func event() -> String {
        switch self {
        case .connectResponse:
            return "connect_response"
        case .message:
            return "message"
        }
    }

    func items() -> [String: Any]? {
        switch self {
        case .message(let roomId, let data):
            return [
                "room_id": roomId,
                "data": data
            ]
        default:
            return nil
        }
    }

}
