import Foundation

import RxSwift

protocol BookmarkRemoteDataSource: RemoteDataSource<BookmarkAPI> {
    func postBookmark(name: String, title: String, kind: String) -> Completable
    func deleteBookmark(name: String, title: String, kind: String) -> Completable
}
