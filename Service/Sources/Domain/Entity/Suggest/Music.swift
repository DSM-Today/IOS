import Foundation

public struct Music: Equatable {
    public let imagePath: URL
    public let situation: String
    public let title: String
    public let songWriter: String
    public let publishedAt: Date
    public let directUrl: URL
}
