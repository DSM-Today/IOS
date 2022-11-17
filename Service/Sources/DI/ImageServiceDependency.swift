import Foundation

import RxSwift

public struct ImageServiceDependency {
    public let postImageUseCase: PostImageUseCase
}

public extension ImageServiceDependency {
    static func resolve() -> ImageServiceDependency {

        let repository = ImageRepotiroyImpl()

        let postImageUseCase = PostImageUseCase(
            repository: repository
        )

        return .init(postImageUseCase: postImageUseCase)
    }
}
