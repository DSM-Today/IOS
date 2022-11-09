import Foundation

import RxSwift

public class FetchMovieUseCase {

    private let reposiotry: SuggestRepository

    init(reposiotry: SuggestRepository) {
        self.reposiotry = reposiotry
    }

    public func excute() -> Single<Movie> {
        return reposiotry.fetchMovie()
    }

}
