import Foundation

import RxSwift

protocol ImageRemoteDataSource: RemoteDataSource<ImageAPI> {
    func postImage(_ image: Data) -> Single<Image>
}
