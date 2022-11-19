import Foundation

import RxSwift

protocol ImageRepository {
    func postImage(image: Data) -> Single<Image>
}
