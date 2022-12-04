import Foundation

import RxSwift
import RxCocoa
import RxFlow
import Service

class ChatViewModel: ViewModel, Stepper {

    private let fetchChatListUseCase: FetchChatListUseCase
    private let fetchRoomIdUseCase: FetchRoomIdUseCase
    private let sendMessageUseCase: SendMessageUseCase
    private let messageUseCase: MessageUseCase
    private let leaveUseCase: LeaveUseCase
    private let fetchProfileUseCase: FetchProfileUseCase

    init(
        fetchChatListUseCase: FetchChatListUseCase,
        fetchRoomIdUseCase: FetchRoomIdUseCase,
        sendMessageUseCase: SendMessageUseCase,
        messageUseCase: MessageUseCase,
        leaveUseCase: LeaveUseCase,
        fetchProfileUseCase: FetchProfileUseCase
    ) {
        self.fetchChatListUseCase = fetchChatListUseCase
        self.fetchRoomIdUseCase = fetchRoomIdUseCase
        self.sendMessageUseCase = sendMessageUseCase
        self.messageUseCase = messageUseCase
        self.leaveUseCase = leaveUseCase
        self.fetchProfileUseCase = fetchProfileUseCase
    }

    var steps = PublishRelay<Step>()
    private var disposeBag = DisposeBag()
    private let socketIoManager = SocketIOManager.shared

    struct Input {
        let viewAppear: Driver<Void>
        let message: Driver<String>
        let sendMessage: Driver<Void>
        let leaveRoom: Driver<Void>
    }

    struct Output {
        let chatList: BehaviorRelay<[Chat]>
        let myName: String
    }

    // swiftlint:disable function_body_length
    func transform(_ input: Input) -> Output {

        let chatList = BehaviorRelay<[Chat]>(value: [])
        let roomId = PublishRelay<String>()
        let messageInfo = Driver.combineLatest(roomId.asDriver(onErrorJustReturn: ""), input.message)
        let connectSucces = PublishRelay<Void>()
        var name: String = ""

        input.viewAppear
            .asObservable()
            .subscribe(onNext: {
                self.socketIoManager.establishConnection()
                connectSucces.accept(())
            })
            .disposed(by: disposeBag)

        input.viewAppear
            .asObservable()
            .flatMap { self.fetchProfileUseCase.excute() }
            .subscribe(onNext: {
                name = $0.name
            })
            .disposed(by: disposeBag)

        input.leaveRoom
            .asObservable()
            .subscribe(onNext: {
                self.leaveUseCase.excute()
                self.socketIoManager.closeConnection()
            })
            .disposed(by: disposeBag)

        roomId.asObservable()
            .flatMap { self.fetchChatListUseCase.excute(roomId: $0) }
            .subscribe(onNext: {
                chatList.accept($0)
            })
            .disposed(by: disposeBag)

        input.sendMessage
            .asObservable()
            .withLatestFrom(messageInfo)
            .subscribe(onNext: {
                self.sendMessageUseCase.excute(roomId: $0, message: $1)
            })
            .disposed(by: disposeBag)

        connectSucces
            .flatMap { self.messageUseCase.excute() }
            .subscribe(onNext: {
                var values = chatList.value
                values.append($0)
                chatList.accept(values)
            })
            .disposed(by: disposeBag)

        connectSucces
            .flatMap { self.fetchRoomIdUseCase.excute() }
            .subscribe(onNext: {
                roomId.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(chatList: chatList, myName: name)
    }
}
