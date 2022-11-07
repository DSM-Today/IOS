import Foundation

import KeychainSwift

final class KeychainTask {

    static let shared = KeychainTask()
    private let keychainSwift = KeychainSwift()

    init() { }

    func registerAccessToken(_ accessToken: String) {
        keychainSwift.delete("access_token")
        keychainSwift.set(accessToken, forKey: "access_token")
    }

    func fetchAccessToken() -> String? {
        return keychainSwift.get("access_token")
    }

    func registerRefreshToken(_ refreshToken: String) {
        keychainSwift.delete("refresh_token")
        keychainSwift.set(refreshToken, forKey: "refresh_token")
    }

    func fetchRefreshToken() -> String? {
        return keychainSwift.get("refresh_token")
    }

    func deleteToken() {
        keychainSwift.delete("access_token")
        keychainSwift.delete("refresh_token")
    }
}
