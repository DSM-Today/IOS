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

    init(
        fetchChatListUseCase: FetchChatListUseCase,
        fetchRoomIdUseCase: FetchRoomIdUseCase,
        sendMessageUseCase: SendMessageUseCase,
        messageUseCase: MessageUseCase,
        leaveUseCase: LeaveUseCase
    ) {
        self.fetchChatListUseCase = fetchChatListUseCase
        self.fetchRoomIdUseCase = fetchRoomIdUseCase
        self.sendMessageUseCase = sendMessageUseCase
        self.messageUseCase = messageUseCase
        self.leaveUseCase = leaveUseCase
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
    }

    func transform(_ input: Input) -> Output {
        let chatList = BehaviorRelay<[Chat]>(value: [])
        let roomId = PublishRelay<String>()
        let messageInfo = Driver.combineLatest(roomId.asDriver(onErrorJustReturn: ""), input.message)

        input.viewAppear
            .asObservable()
            .subscribe(onNext: {
                self.socketIoManager.establishConnection()
            })
            .disposed(by: disposeBag)

        input.leaveRoom
            .asObservable()
            .subscribe(onNext: {
                self.leaveUseCase.excute()
            })
            .disposed(by: disposeBag)

        input.leaveRoom
            .asObservable()
            .subscribe(onNext: {
                self.socketIoManager.closeConnection()
            })
            .disposed(by: disposeBag)

        self.fetchRoomIdUseCase.excute()
            .subscribe(onNext: {
                roomId.accept($0)
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

        self.messageUseCase.excute()
            .subscribe(onNext: {
                var values = chatList.value
                values.append($0)
                chatList.accept(values)
            })
            .disposed(by: disposeBag)

        return Output(chatList: chatList)
    }
}
