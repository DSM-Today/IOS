import Foundation

import RxSwift
import Moya

class ImageRemoteDataSourceImpl: RemoteDataSource<ImageAPI>, ImageRemoteDataSource {

    func postImage(_ image: Data) -> Single<Image> {
        return request(.postImage(image))
            .map(ImageResponse.self)
            .map { $0.toDomain() }
    }

}
