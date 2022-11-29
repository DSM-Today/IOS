import Foundation

import RxSwift

public struct ChatServiceDependency {
    public let fetchChatListUseCase: FetchChatListUseCase
    public let fetchRoomIdUseCase: FetchRoomIdUseCase
    public let sendMessageUsecase: SendMessageUseCase
    public let messageUseCase: MessageUseCase
    public let leaveUseCase: LeaveUseCase
}

public extension ChatServiceDependency {

    static func resolve() -> ChatServiceDependency {

        let remoteDataSource = ChatRemoteDataSourceImpl()
        let socketDataSource = SocketRemoteDataSourceImpl()

        let repository = ChatRepositoryImpl(
            remoteDataSource: remoteDataSource,
            socketDataSource: socketDataSource
        )

        let fetchChatListUseCase = FetchChatListUseCase(
            repository: repository
        )
        let fetchRoomIdUseCase = FetchRoomIdUseCase(
            repository: repository
        )
        let sendMessageUseCase = SendMessageUseCase(
            repository: repository
        )
        let messageUseCase = MessageUseCase(
            repository: repository
        )
        let leaveUseCase = LeaveUseCase(
            repository: repository
        )

        return .init(
            fetchChatListUseCase: fetchChatListUseCase,
            fetchRoomIdUseCase: fetchRoomIdUseCase,
            sendMessageUsecase: sendMessageUseCase,
            messageUseCase: messageUseCase,
            leaveUseCase: leaveUseCase
        )
    }

}
