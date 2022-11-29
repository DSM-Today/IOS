import Foundation

import RxSwift

protocol ChatRepository {
    func fetchChatList(roomId: String) -> Observable<[Chat]>
    func fetchRoomId() -> Observable<String>
    func sendMessage(roomId: String, message: String)
    func message() -> Observable<Chat>
    func leave()
}
