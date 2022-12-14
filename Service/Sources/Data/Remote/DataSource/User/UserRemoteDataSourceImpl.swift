import Foundation

import RxSwift

final class UserRemoteDataSourceImpl: RemoteDataSource<UserAPI>, UserRemoteDataSource {

    func fetchBookmarkList() -> Single<[BookmarkSubject]> {
        return request(.fetchBookmarkList)
            .map(BookmarkListResponse.self)
            .map { $0.toDomain() }
    }

    func editProfile(profileRequest: ProfileRequest) -> Completable {
        return request(.editProfile(profileRequest))
            .asCompletable()
    }

    func fetchProfile() -> Single<Profile> {
        return request(.fetchProfile)
            .map(ProfileResponse.self)
            .map { $0.toDomain() }
    }

    func initProfile(initProfileRequest: InitProfileRequest) -> Completable {
        return request(.initProfile(initProfileRequest))
            .asCompletable()
    }
}
