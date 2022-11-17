import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class MainViewModel: ViewModel, Stepper {

    private let fetchTodoListUseCase: FetchTodoListUseCase

    init(fetchTodoListUseCase: FetchTodoListUseCase) {
        self.fetchTodoListUseCase = fetchTodoListUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
        let randomViewDidTap: Driver<Void>
        let informationViewDidTap: Driver<Void>
        let recommendViewDidTap: Driver<Void>
    }

    struct Output {
        let todoList: BehaviorRelay<[Todo]>
    }

    func transform(_ input: Input) -> Output {
        let todoList = BehaviorRelay<[Todo]>(value: [])

        input.viewAppear
            .asObservable()
            .flatMap { self.fetchTodoListUseCase.excute() }
            .subscribe(onNext: {
                todoList.accept($0)
            })
            .disposed(by: disposeBag)

        input.randomViewDidTap
            .asObservable()
            .map { TodayStep.randomCategoryIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)

        input.informationViewDidTap
            .asObservable()
            .map { TodayStep.informationCategoryIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)

        input.recommendViewDidTap
            .asObservable()
            .map { TodayStep.recommendCategoryIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)

        return Output(todoList: todoList)
    }

}
