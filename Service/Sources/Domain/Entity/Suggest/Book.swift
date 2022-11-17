import Foundation

public struct Book: Equatable {
    public let imageUrl: URL
    public let publisher: String
    public let title: String
    public let writer: String
    public let score: Float
    public let reviewAmount: Int
    public let directUrl: URL
    public let comment: String
}
