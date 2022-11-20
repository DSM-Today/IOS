import Foundation

import RxSwift

class BookmarkRepositoryImpl: BookmarkRepository {

    let remoteDataSource: BookmarkRemoteDataSource

    init(remoteDataSource: BookmarkRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func postBookmark(name: String, title: String, kind: String) -> Completable {
        return remoteDataSource.postBookmark(name: name, title: title, kind: kind)
    }

    func deleteBookmark(name: String, title: String, kind: String) -> Completable {
        return remoteDataSource.deleteBookmark(name: name, title: title, kind: kind)
    }

}
