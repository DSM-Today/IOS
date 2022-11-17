import Foundation

import RxSwift

protocol UserRepository {
    func fetchBookmarkList() -> Observable<[BookmarkSubject]>
    func editProfile(profileRequest: ProfileRequest) -> Completable
    func fetchProfile() -> Single<Profile>
    func initProfile(initProfileRequest: InitProfileRequest) -> Completable
}
