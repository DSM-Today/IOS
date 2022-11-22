import Foundation

public struct AuthServiceDependency {
    public let fetchClientIDUseCase: FetchClientIDUseCase
    public let googleLoginUseCase: GoogleLoginUseCase
    public let refreshTokenUseCase: RefreshTokenUseCase
    public let logoutUseCase: LogOutUseCase
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
        let logoutUseCase = LogOutUseCase(
            repository: repostiroy
        )

        return AuthServiceDependency(
            fetchClientIDUseCase: fetchClientIDUseCase,
            googleLoginUseCase: googleLoginUseCase,
            refreshTokenUseCase: refreshTokenUseCase,
            logoutUseCase: logoutUseCase
        )
    }
}
