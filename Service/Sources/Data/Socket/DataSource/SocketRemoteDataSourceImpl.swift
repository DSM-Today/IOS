import Foundation

import RxSwift

class SocketRemoteDataSourceImpl: SocketRemoteDataSource {

    private let socketIOManager = SocketIOManager.shared

    func fetchRoomId() -> Observable<String> {
        return Observable<String>.create { observable in
            self.socketIOManager.on(.connectResponse) { (data, _) in
                do {
                    let cur = try JSONSerialization.data(withJSONObject: data[0])
                    let roomId = try JSONDecoder().decode(RoomIdResponse.self, from: cur)
                    observable.onNext(roomId.roomId)
                } catch {
                    print(error)
                }
            }
            return Disposables.create()
        }
    }

    func sendMessage(roomId: String, message: String) {
        self.socketIOManager.emit(.sendMessage(roomId: roomId, data: message))
    }

    func message() -> Observable<Chat> {
        return Observable<Chat>.create { observable in
            self.socketIOManager.on(.message) { data, _ in
                do {
                    let cur = try JSONSerialization.data(withJSONObject: data[0])
                    let chat = try JSONDecoder().decode(ChatResponse.self, from: cur)
                    observable.onNext(chat.toDomain())
                } catch {
                    print(error)
                }
            }
            return Disposables.create()
        }
    }

    func leave() {
        self.socketIOManager.emit(.leave)
    }
}
