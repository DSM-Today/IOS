import Foundation

import RxSwift

public class PostImageUseCase {

    private let repository: ImageRepository

    init(repository: ImageRepository) {
        self.repository = repository
    }

    public func excute(image: Data) -> Single<Image> {
        return repository.postImage(image: image)
    }

}
