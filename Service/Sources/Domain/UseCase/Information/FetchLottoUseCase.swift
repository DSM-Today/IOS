import Foundation

import RxSwift

public class FetchLottoUseCase {

    private let repository: InformationRepository

    init(repository: InformationRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Lotto> {
        return repository.fetchLotto()
    }

}
