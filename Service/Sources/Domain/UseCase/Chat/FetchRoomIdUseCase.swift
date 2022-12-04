import Foundation

import RxSwift

public class FetchRoomIdUseCase {

    private let repository: ChatRepository

    init(repository: ChatRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<String> {
        return repository.fetchRoomId()
    }

}
