import Foundation

import SocketIO

public enum TodaySocket {
    case connectResponse
    case sendMessage(roomId: String, data: String)
    case message
    case leave
}

extension TodaySocket {

    var event: String {
        switch self {
        case .connectResponse:
            return "connect_response"
        case .sendMessage, .message:
            return "message"
        case .leave:
            return "leave"
        }
    }

    var items: [String: Any]? {
        switch self {
        case .sendMessage(let roomId, let data):
            return [
                "room_id": roomId,
                "data": data
            ]
        default:
            return nil
        }
    }

}
