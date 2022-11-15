import Foundation

import RxSwift

protocol UserRemoteDataSource: RemoteDataSource<UserAPI> {
    func fetchBookmarkList() -> Single<[Subject]>
    func editProfile(profileRequest: ProfileRequest) -> Completable
    func fetchProfile() -> Single<Profile>
    func initProfile(initProfileRequest: InitProfileRequest) -> Completable
}
