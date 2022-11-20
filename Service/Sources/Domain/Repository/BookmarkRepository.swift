import Foundation

import RxSwift

protocol BookmarkRepository {
    func postBookmark(name: String, title: String, kind: String) -> Completable
    func deleteBookmark(name: String, title: String, kind: String) -> Completable
}
