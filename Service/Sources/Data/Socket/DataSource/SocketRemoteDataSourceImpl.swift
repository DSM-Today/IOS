import Foundation

import RxSwift
import SocketIO

class SocketRemoteDataSourceImpl: SocketRemoteDataSource {

    private let socketIOManager = SocketIOManager.shared

    func fetchRoomId() -> Observable<String> {
        return socketIOManager.on(.connectResponse)
            .flatMap { _ in Observable<String>.just("") }
    }

    func sendMessage(roomId: String, message: String) {
        self.socketIOManager.emit(.sendMessage(roomId: roomId, data: message))
    }

    // swiftlint:disable line_length
    func message() -> Observable<Chat> {
        socketIOManager.on(.message)
            .flatMap { _ in return Observable<Chat>.just(.init(content: "", imageUrl: URL(string: "https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg")!, sender: ""))}
    }

    func leave() {
        self.socketIOManager.emit(.leave)
    }
}
