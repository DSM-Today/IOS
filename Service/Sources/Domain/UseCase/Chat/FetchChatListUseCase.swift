import Foundation

import RxSwift

public class FetchChatListUseCase {

    private let repository: ChatRepository

    init(repository: ChatRepository) {
        self.repository = repository
    }

    public func excute(roomId: String) -> Observable<[Chat]> {
        return repository.fetchChatList(roomId: roomId)
    }

}
