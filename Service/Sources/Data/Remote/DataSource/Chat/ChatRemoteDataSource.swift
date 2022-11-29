import Foundation

import RxSwift

protocol ChatRemoteDataSource: RemoteDataSource<ChatAPI> {
    func fetchChatMessage(roomId: Int) -> Single<String>
}
