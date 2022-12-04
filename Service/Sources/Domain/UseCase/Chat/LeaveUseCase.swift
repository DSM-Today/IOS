import Foundation

import RxSwift

public class LeaveUseCase {

    private let repository: ChatRepository

    init(repository: ChatRepository) {
        self.repository = repository
    }

    public func excute() {
        return repository.leave()
    }

}
