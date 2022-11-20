import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class RecommendCategoryViewModel: ViewModel, Stepper {

    private let fetchSubjectSuggestListUseCase: FetchSubjectSuggestListUseCase
    private let postBookmarkUseCase: PostBookmarkUseCase
    private let deleteBookmarkUseCase: DeleteBookmarkUseCase

    init(
        fetchSubjectSuggestListUseCase: FetchSubjectSuggestListUseCase,
        postBookmarkUseCase: PostBookmarkUseCase,
        deleteBookmarkUseCase: DeleteBookmarkUseCase
    ) {
        self.fetchSubjectSuggestListUseCase = fetchSubjectSuggestListUseCase
        self.postBookmarkUseCase = postBookmarkUseCase
        self.deleteBookmarkUseCase = deleteBookmarkUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
        let index: Driver<IndexPath>
        let bookmark: Driver<Int>
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

        input.bookmark
            .asObservable()
            .flatMap { row in
                let subject = subjectList.value[row]
                if subject.isMarked {
                    return self.deleteBookmarkUseCase.excute(
                        name: subject.name,
                        title: subject.title,
                        kind: "SUGGEST"
                    )
                } else {
                    return self.postBookmarkUseCase.excute(
                        name: subject.name,
                        title: subject.title,
                        kind: "SUGGEST"
                    )
                }
            }
            .subscribe(onNext: { _ in
            })
            .disposed(by: disposeBag)

        return Output(subjectList: subjectList)
    }

}
