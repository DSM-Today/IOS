import Foundation

import RxSwift

public struct InformationDependency {
    public let fetchSubjectInformationListUseCase: FetchSubjectInformationListuseCase
    public let fetchNewsUseCase: FetchNewsUseCase
    public let fetchLottoUseCase: FetchLottoUseCase
    public let bookmarkNewsUseCase: BookmarkNewsUseCase
    public let bookmarkLottoUseCase: BookmarkLottoUseCase
    public let deleteBookmarkNewsUseCase: DeleteBookmarkNewsUseCase
    public let deleteBookmarkLottoUseCase: DeleteBookmarkLottoUseCase
}

public extension InformationDependency {

    static func resolve() -> InformationDependency {
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

        return InformationDependency(
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
