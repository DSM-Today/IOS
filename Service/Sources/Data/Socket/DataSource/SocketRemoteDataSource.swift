import Foundation

import RxSwift

protocol SocketRemoteDataSource {
    func fetchRoomId() -> Observable<String>
    func sendMessage(roomId: String, message: String)
    func message() -> Observable<Chat>
    func leave()
}
