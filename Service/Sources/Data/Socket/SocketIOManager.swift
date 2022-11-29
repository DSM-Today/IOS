import Foundation

import SocketIO

final class SocketIOManager {

    static let shared = SocketIOManager()

    private let manager = SocketManager(
        socketURL: URL(string: "http://43.201.53.240:8000")!,
        config: [
            .log(true),
            .extraHeaders(["Authorization": "Bearer \(KeychainTask.shared.fetchAccessToken() ?? "")"])
        ]
    )
    private var socket: SocketIOClient!

    init() {
        socket = self.manager.socket(forNamespace: "/chat")
    }

    func establishConnection() {
        self.socket.connect()
    }

    func closeConnection() {
        self.socket.disconnect()
    }

    func on(_ api: TodaySocket, callback: @escaping (([Any], SocketAckEmitter) -> Void)) {
        self.socket.on(api.event(), callback: callback)
    }

    func emit(_ api: TodaySocket) {
        self.socket.emit(api.event(), api.items()!)
    }

}
