import Foundation

import Moya
import RxSwift

class ChatRemoteDataSourceImpl: RemoteDataSource<ChatAPI>, ChatRemoteDataSource {

    func fetchChatMessage(roomId: Int) -> Single<String> {
        return request(.fetchChatMessage(roomId: roomId))
            .map { _ in return "" }
    }

}
