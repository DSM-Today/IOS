import Foundation

import RxSwift

class ChatRepositoryImpl: ChatRepository {

    let remoteDataSource: ChatRemoteDataSource
    let socketDataSource: SocketRemoteDataSource

    init(
        remoteDataSource: ChatRemoteDataSource,
        socketDataSource: SocketRemoteDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.socketDataSource = socketDataSource
    }

    func fetchChatList(roomId: String) -> Observable<[Chat]> {
        return remoteDataSource.fetchChatMessage(roomId: roomId)
            .asObservable()
    }

    func fetchRoomId() -> Observable<String> {
        return socketDataSource.fetchRoomId()
    }

    func sendMessage(roomId: String, message: String) {
        return socketDataSource.sendMessage(roomId: roomId, message: message)
    }

    func message() -> Observable<Chat> {
        return socketDataSource.message()
    }

    func leave() {
        return socketDataSource.leave()
    }

}
