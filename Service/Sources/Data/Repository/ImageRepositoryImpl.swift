import Foundation

import RxSwift

public class ImageRepotiroyImpl: ImageRepository {

    let remoteDataSource = ImageRemoteDataSourceImpl()

    func postImage(image: Data) -> Single<Image> {
        return remoteDataSource.postImage(image)
    }

}
