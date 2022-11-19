import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class EditProfileViewModel: ViewModel, Stepper {

    private let fetchProfileUseCase: FetchProfileUseCase
    private let editProfileUseCase: EditProfileUseCase
    private let postImageUseCase: PostImageUseCase

    init(
        fetchProfileUseCase: FetchProfileUseCase,
        editProfileUseCase: EditProfileUseCase,
        postImageUseCase: PostImageUseCase
    ) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.editProfileUseCase = editProfileUseCase
        self.postImageUseCase = postImageUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()
    private var imageDataString = ""

    struct Input {
        let viewAppear: Driver<Void>
        let image: Driver<Data>
        let name: Driver<String>
        let introduce: Driver<String>
        let birthDay: Driver<Date>
        let completeButtonDidTap: Driver<Void>
    }

    struct Output {
        let profileValue: PublishRelay<Profile>
    }

    func transform(_ input: Input) -> Output {
        let profileValue = PublishRelay<Profile>()
        let profileInfo = Driver.combineLatest(input.name, input.introduce, input.birthDay)

        input.viewAppear
            .asObservable()
            .flatMap { self.fetchProfileUseCase.excute() }
            .subscribe(onNext: {
                self.imageDataString = $0.imageUrl.absoluteString
                profileValue.accept($0)
            })
            .disposed(by: disposeBag)

        input.completeButtonDidTap
            .asObservable()
            .withLatestFrom(profileInfo)
            .flatMap { name, introduce, birthDay in
                self.editProfileUseCase.excute(
                    imagePath: self.imageDataString,
                    name: name,
                    introduce: introduce,
                    birthDay: birthDay.toString(format: "yyyy-MM-dd")
                )
                .andThen(Single.just(TodayStep.moveToBackIsRequired))
            }
            .bind(to: steps)
            .disposed(by: disposeBag)

        input.image
            .asObservable()
            .flatMap { self.postImageUseCase.excute(image: $0) }
            .subscribe(onNext: {
                self.imageDataString = $0.imageUrlString
            })
            .disposed(by: disposeBag)

        return Output(profileValue: profileValue)
    }

}
