import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class RecommendCategoryViewModel: ViewModel, Stepper {

    private let fetchSubjectSuggestListUseCase: FetchSubjectSuggestListUseCase

    init(fetchSubjectSuggestListUseCase: FetchSubjectSuggestListUseCase) {
        self.fetchSubjectSuggestListUseCase = fetchSubjectSuggestListUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
        let index: Driver<IndexPath>
    }

    struct Output {
        let subjectList: BehaviorRelay<[Subject]>
    }

    func transform(_ input: Input) -> Output {
        let subjectList = BehaviorRelay<[Subject]>(value: [])

        input.viewAppear
            .asObservable()
            .flatMap {
                self.fetchSubjectSuggestListUseCase.excute()
            }
            .subscribe(onNext: {
                subjectList.accept($0)
            })
            .disposed(by: disposeBag)

        input.index
            .asObservable()
            .map { index in
                let value = subjectList.value
                return value[index.row].title.toTodayStep()
            }
            .bind(to: steps)
            .disposed(by: disposeBag)

        return Output(subjectList: subjectList)
    }

}
