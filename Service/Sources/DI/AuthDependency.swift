import Foundation

public struct AuthDependency {
    public let googleOAuthUseCase: FetchClientIDUseCase
    public let googleLoginUseCase: GoogleLoginUseCase
    public let refreshTokenUseCase: RefreshTokenUseCase
}

public extension AuthDependency {

    func resolve() -> AuthDependency {

        let remoteDataSource = AuthRemoteDataSourceImpl()
        let repostiroy = AuthRepositoryImpl(remoteDataSource: remoteDataSource)

        let googleOAuthUseCase = FetchClientIDUseCase(
            repository: repostiroy
        )
        let googleLoginUseCase = GoogleLoginUseCase(
            repository: repostiroy
        )
        let refreshTokenUseCase = RefreshTokenUseCase(
            repository: repostiroy
        )

        return AuthDependency(
            googleOAuthUseCase: googleOAuthUseCase,
            googleLoginUseCase: googleLoginUseCase,
            refreshTokenUseCase: refreshTokenUseCase
        )
    }
}
