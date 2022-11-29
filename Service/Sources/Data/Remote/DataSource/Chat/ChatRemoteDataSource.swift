import Foundation

import RxSwift

protocol ChatRemoteDataSource: RemoteDataSource<ChatAPI> {
    func fetchChatMessage(roomId: String) -> Single<[Chat]>
}
