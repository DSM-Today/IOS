import Foundation

import RxSwift

public class UserRepositoryImpl: UserRepository {

    let remoteDataSource: UserRemoteDataSource

    init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchBookmarkList() -> Observable<[Subject]> {
        return remoteDataSource.fetchBookmarkList()
            .asObservable()
    }

    func editProfile(profileRequest: ProfileRequest) -> Completable {
        return remoteDataSource.editProfile(profileRequest: profileRequest)
    }

    func fetchProfile() -> Single<Profile> {
        return remoteDataSource.fetchProfile()
    }

    func initProfile(initProfileRequest: InitProfileRequest) -> Completable {
        return remoteDataSource.initProfile(initProfileRequest: initProfileRequest)
    }
}
