import Foundation

public struct Chat: Equatable {
    public let content: String
    public let imageUrl: URL
    public let sender: String
    public let isMine: Bool
}
