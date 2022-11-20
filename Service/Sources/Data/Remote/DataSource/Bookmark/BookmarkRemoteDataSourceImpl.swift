import Foundation

import RxSwift
import Moya

class BookarmkRemoteDataSourceImpl: RemoteDataSource<BookmarkAPI>, BookmarkRemoteDataSource {

    func postBookmark(name: String, title: String, kind: String) -> Completable {
        return request(.postBookmark(name, title, kind))
            .asCompletable()
    }

    func deleteBookmark(name: String, title: String, kind: String) -> Completable {
        return request(.deleteBookmark(name, title, kind))
            .asCompletable()
    }

}
