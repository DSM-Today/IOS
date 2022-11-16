import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class RandomCategoryViewModel: ViewModel, Stepper {

    private let fetchSubjectRandomListUseCase: FetchSubjectRandomListUseCase

    init(fetchSubjectRandomListUseCase: FetchSubjectRandomListUseCase) {
        self.fetchSubjectRandomListUseCase = fetchSubjectRandomListUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
    }

    struct Output {
        let subjectList: BehaviorRelay<[Subject]>
    }

    func transform(_ input: Input) -> Output {
        let subjectList = BehaviorRelay<[Subject]>(value: [])

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchSubjectRandomListUseCase.excute()
            }
            .subscribe(onNext: {
                subjectList.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(subjectList: subjectList)
    }

}
