import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class MyPageViewModel: ViewModel, Stepper {

    private let fetchProfileUseCase: FetchProfileUseCase
    private let fetchBookmarkListUseCase: FetchBookmarkListUseCase

    init(
        fetchProfileUseCase: FetchProfileUseCase,
        fetchBookmarkListUseCase: FetchBookmarkListUseCase
    ) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.fetchBookmarkListUseCase = fetchBookmarkListUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()

    struct Input {
        let viewAppear: Driver<Void>
        let moveToEditProfile: Driver<Void>
        let index: Driver<IndexPath>
    }

    struct Output {
        let profileValue: PublishRelay<Profile>
        let bookmarkList: BehaviorRelay<[BookmarkSubject]>
    }

    func transform(_ input: Input) -> Output {
        let profileValue = PublishRelay<Profile>()
        let bookmarkList = BehaviorRelay<[BookmarkSubject]>(value: [])

        input.viewAppear
            .asObservable()
            .flatMap { self.fetchProfileUseCase.excute() }
            .subscribe(onNext: {
                profileValue.accept($0)
            })
            .disposed(by: disposeBag)

        input.viewAppear
            .asObservable()
            .flatMap { self.fetchBookmarkListUseCase.excute() }
            .subscribe(onNext: {
                bookmarkList.accept($0)
            })
            .disposed(by: disposeBag)

        input.moveToEditProfile
            .asObservable()
            .map { TodayStep.editProfileIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)

        input.index
            .asObservable()
            .map {
                let value = bookmarkList.value[$0.row]
                return value.title.toTodayStep()
            }
            .bind(to: steps)
            .disposed(by: disposeBag)

        return Output(profileValue: profileValue, bookmarkList: bookmarkList)
    }

}
