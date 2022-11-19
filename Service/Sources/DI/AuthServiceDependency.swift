import Foundation

public struct AuthServiceDependency {
    public let fetchClientIDUseCase: FetchClientIDUseCase
    public let googleLoginUseCase: GoogleLoginUseCase
    public let refreshTokenUseCase: RefreshTokenUseCase
}

public extension AuthServiceDependency {

    static func resolve() -> Self {

        let remoteDataSource = AuthRemoteDataSourceImpl()
        let repostiroy = AuthRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchClientIDUseCase = FetchClientIDUseCase(
            repository: repostiroy
        )
        let googleLoginUseCase = GoogleLoginUseCase(
            repository: repostiroy
        )
        let refreshTokenUseCase = RefreshTokenUseCase(
            repository: repostiroy
        )

        return AuthServiceDependency(
            fetchClientIDUseCase: fetchClientIDUseCase,
            googleLoginUseCase: googleLoginUseCase,
            refreshTokenUseCase: refreshTokenUseCase
        )
    }
}
