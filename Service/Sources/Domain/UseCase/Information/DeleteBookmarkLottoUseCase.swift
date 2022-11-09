import Foundation

import RxSwift

public class DeleteBookmarkLottoUseCase {

    private let repository: InformationRepository

    init(repository: InformationRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        return repository.deleteBookmarkLotto()
    }

}
