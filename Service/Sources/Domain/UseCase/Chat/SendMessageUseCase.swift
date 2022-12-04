import Foundation

import RxSwift

public class SendMessageUseCase {

    private let repository: ChatRepository

    init(repository: ChatRepository) {
        self.repository = repository
    }

    public func excute(roomId: String, message: String) {
        return repository.sendMessage(roomId: roomId, message: message)
    }
}
