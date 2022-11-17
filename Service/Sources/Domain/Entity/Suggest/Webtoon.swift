import Foundation

public struct Webtoon: Equatable {
    public let isAdult: String
    public let isWorking: String
    public let directUrl: URL
    public let title: String
    public let imageUrl: URL
    public let writer: String
    public let comment: String
    public let genre: String
}
