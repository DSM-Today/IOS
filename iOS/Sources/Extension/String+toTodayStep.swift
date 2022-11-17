import Foundation

extension String {
    // swiftlint:disable cyclomatic_complexity
    func toTodayStep() -> TodayStep {
        switch self {
        case "오늘의 꽃":
            return .flowerIsRequired
        case "오늘의 운세":
            return .fortuneIsRequired
        case "오늘의 퀴즈":
            return .quizIsRequired
        case "오늘의 사자성어":
            return .idiomIsRequired
        case "오늘의 인물":
            return .characterIsRequired
        case "오늘의 카페 메뉴":
            return .cafemenuIsRequired
        case "오늘의 영화":
            return .movieIsRequired
        case "오늘의 음악":
            return .musicIsRequired
        case "오늘의 웹툰":
            return .webtoonIsRequired
        case "오늘의 음식":
            return .foodIsRequired
        case "오늘의 책":
            return .bookIsRequired
        case "오늘의 뉴스":
            return .newsIsRequired
        case "오늘의 로또":
            return .lottoIsRequired
        default:
            return .none
        }
    }
}
