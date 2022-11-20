import Foundation

import RxSwift

public struct InformationServiceDependency {
    public let fetchSubjectInformationListUseCase: FetchSubjectInformationListuseCase
    public let fetchNewsUseCase: FetchNewsUseCase
    public let fetchLottoUseCase: FetchLottoUseCase
}

public extension InformationServiceDependency {

    static func resolve() -> InformationServiceDependency {
        let remoteDataSource = InformationRemoteDataSourceImpl()
        let repository = InformationRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchSubjectInformatinoListUseCase = FetchSubjectInformationListuseCase(
            repository: repository
        )
        let fetchNewsUseCase = FetchNewsUseCase(
            repository: repository
        )
        let fetchLottoUseCase = FetchLottoUseCase(
            repository: repository
        )

        return InformationServiceDependency(
            fetchSubjectInformationListUseCase: fetchSubjectInformatinoListUseCase,
            fetchNewsUseCase: fetchNewsUseCase,
            fetchLottoUseCase: fetchLottoUseCase
        )
    }
}
