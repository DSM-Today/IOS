import Foundation

import Moya
import RxSwift

class ChatRemoteDataSourceImpl: RemoteDataSource<ChatAPI>, ChatRemoteDataSource {

    func fetchChatMessage(roomId: String) -> Single<[Chat]> {
        return request(.fetchChatMessage(roomId: roomId))
            .map(ChatListResponse.self)
            .map { $0.toDomain() }
    }

}
