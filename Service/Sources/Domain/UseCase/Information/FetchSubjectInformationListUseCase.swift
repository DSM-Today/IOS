import Foundation

import RxSwift

public class FetchSubjectInformationListuseCase {

    private let repository: InformationRepository

    init(repository: InformationRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[Subject]> {
        return repository.fetchInformationList()
    }

}
