import Foundation

import RxSwift

protocol InformationRepository {
    func fetchInformationList() -> Observable<[Subject]>
    func fetchNews() -> Single<News>
    func fetchLotto() -> Single<Lotto>
}
