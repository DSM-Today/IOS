import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class InformationCategoryViewModel: ViewModel, Stepper {

    private let fetchSubjectInformationListUseCase: FetchSubjectInformationListuseCase

    init(fetchSubjectInformationListUseCase: FetchSubjectInformationListuseCase) {
        self.fetchSubjectInformationListUseCase = fetchSubjectInformationListUseCase
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
            .flatMap { self.fetchSubjectInformationListUseCase.excute() }
            .subscribe(onNext: {
                subjectList.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(subjectList: subjectList)
    }

}
