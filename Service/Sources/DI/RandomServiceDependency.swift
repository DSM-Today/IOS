import Foundation

import RxSwift

public struct RandomServiceDependency {
    public let fetchSubjectRandomListUseCase: FetchSubjectRandomListUseCase
    public let fetchFlowerUseCase: FetchFlowerUseCase
    public let fetchLuckyUseCase: FetchLuckyUseCase
    public let fetchQuizUseCase: FetchQuizUseCase
    public let fetchIdiomUseCase: FetchIdiomUseCase
    public let fetchCharacterUseCase: FetchCharacterUseCase
}

public extension RandomServiceDependency {

    static func resolve() -> RandomServiceDependency {

        let remoteDataSource = RandomRemoteDataSourceImpl()
        let repository = RandomRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchSubjectRandomListUseCase = FetchSubjectRandomListUseCase(
            repository: repository
        )
        let fetchFlowerUseCase = FetchFlowerUseCase(
            repository: repository
        )
        let fetchLuckyUseCase = FetchLuckyUseCase(
            repository: repository
        )
        let fetchQuizUseCase = FetchQuizUseCase(
            repository: repository
        )
        let fetchIdiomUseCase = FetchIdiomUseCase(
            repository: repository
        )
        let fetchCharacterUseCase = FetchCharacterUseCase(
            repository: repository
        )

        return RandomServiceDependency(
            fetchSubjectRandomListUseCase: fetchSubjectRandomListUseCase,
            fetchFlowerUseCase: fetchFlowerUseCase,
            fetchLuckyUseCase: fetchLuckyUseCase,
            fetchQuizUseCase: fetchQuizUseCase,
            fetchIdiomUseCase: fetchIdiomUseCase,
            fetchCharacterUseCase: fetchCharacterUseCase
        )
    }
}
