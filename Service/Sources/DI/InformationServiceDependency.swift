import Foundation

import RxSwift

public struct InformationServiceDependency {
    public let fetchSubjectInformationListUseCase: FetchSubjectInformationListuseCase
    public let fetchNewsUseCase: FetchNewsUseCase
    public let fetchLottoUseCase: FetchLottoUseCase
    public let bookmarkNewsUseCase: BookmarkNewsUseCase
    public let bookmarkLottoUseCase: BookmarkLottoUseCase
    public let deleteBookmarkNewsUseCase: DeleteBookmarkNewsUseCase
    public let deleteBookmarkLottoUseCase: DeleteBookmarkLottoUseCase
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
        let bookmarkNewsUseCase = BookmarkNewsUseCase(
            repository: repository
        )
        let bookmarkLottoUseCase = BookmarkLottoUseCase(
            repository: repository
        )
        let deleteBookmarkNewsUseCase = DeleteBookmarkNewsUseCase(
            repository: repository
        )
        let deleteBookmarkLottoUseCase = DeleteBookmarkLottoUseCase(
            repository: repository
        )

        return InformationServiceDependency(
            fetchSubjectInformationListUseCase: fetchSubjectInformatinoListUseCase,
            fetchNewsUseCase: fetchNewsUseCase,
            fetchLottoUseCase: fetchLottoUseCase,
            bookmarkNewsUseCase: bookmarkNewsUseCase,
            bookmarkLottoUseCase: bookmarkLottoUseCase,
            deleteBookmarkNewsUseCase: deleteBookmarkNewsUseCase,
            deleteBookmarkLottoUseCase: deleteBookmarkLottoUseCase
        )
    }
}
