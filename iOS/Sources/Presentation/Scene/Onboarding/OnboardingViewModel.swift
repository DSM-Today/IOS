import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class OnboardingViewModel: ViewModel, Stepper {

    private let fetchClientIDUseCase: FetchClientIDUseCase
    private let googleLoginUseCase: GoogleLoginUseCase

    init(
        fetchClientIDUseCase: FetchClientIDUseCase,
        googleLoginUseCase: GoogleLoginUseCase
    ) {
        self.fetchClientIDUseCase = fetchClientIDUseCase
        self.googleLoginUseCase = googleLoginUseCase
    }

    var steps = PublishRelay<Step>()

    struct Input {
        let googleLoginButtonDidTap: Driver<Void>
        let idToken: Driver<String>
    }

    struct Output {
        let clientID: PublishRelay<ClientID>
        let loginEntity: PublishRelay<LoginEntity>
    }

    private var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        let clientID = PublishRelay<ClientID>()
        let loginEntity = PublishRelay<LoginEntity>()

        input.googleLoginButtonDidTap
            .asObservable()
            .flatMap { self.fetchClientIDUseCase.excute() }
            .subscribe(onNext: {
                print("//////////////")
                print($0)
                clientID.accept($0)
            })
            .disposed(by: disposeBag)

        input.idToken
            .asObservable()
            .flatMap { self.googleLoginUseCase.excute(idToken: $0) }
            .subscribe(onNext: {
                print("!!!!!!")
                print($0)
                loginEntity.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(clientID: clientID, loginEntity: loginEntity)
    }

}
