import Foundation

import RxSwift

public class MessageUseCase {

    private let repository: ChatRepository

    init(repository: ChatRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<Chat> {
        return repository.message()
    }

}
