import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class CharacterViewModel: ViewModel, Stepper {

    private let fetchCharacterUseCase: FetchCharacterUseCase

    init(fetchCharacterUseCase: FetchCharacterUseCase) {
        self.fetchCharacterUseCase = fetchCharacterUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        let characterValue: PublishRelay<Character>
    }

    func transform(_ input: Input) -> Output {
        let characterValue = PublishRelay<Character>()

        input.viewAppear
            .asObservable()
            .flatMap { self.fetchCharacterUseCase.excute() }
            .subscribe(onNext: {
                characterValue.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(characterValue: characterValue)
    }
}
