import Foundation

import SocketIO
import RxSwift

public final class SocketIOManager: NSObject {

    public static let shared = SocketIOManager()

    private let manager = SocketManager(
        socketURL: URL(string: "https://03ea-211-36-142-183.jp.ngrok.io")!,
        config: [
            .log(true),
            .compress,
            .extraHeaders(["Authorization": "Bearer \(KeychainTask.shared.fetchAccessToken() ?? "")"]),
            .forceWebsockets(true)
        ]
    )

    private var socket: SocketIOClient!

    override init() {
        super.init()
        self.socket = self.manager.socket(forNamespace: "/chat")
        self.socket.connect()
        self.socket.on(clientEvent: .connect) { data, _ in
            print("-----")
            print(data)
        }
        self.socket.on("connect_response") { data, _ in
            print("!!!!!!!")
            print(data)
        }
    }

    public func establishConnection() {
        self.socket.connect()
    }

    public func closeConnection() {
        self.socket.disconnect()
    }

    public func on(_ api: TodaySocket) -> Observable<[Any]> {
        return Observable<[Any]>.create { observar in
//            self.socket.on(api.event) { data, _ in
//                observar.onNext(data)
//            }
            return Disposables.create()
        }
    }

    public func emit(_ api: TodaySocket) {
        print("!!!!!")
        self.socket.emit(api.event, api.items ?? [])
    }

}
