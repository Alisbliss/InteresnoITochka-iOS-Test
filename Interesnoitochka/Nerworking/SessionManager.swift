//
//  SessionManager.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 13.02.2026.
//

import Alamofire
import Foundation

// Добавляем nonisolated, если файл целиком под MainActor
nonisolated struct SessionResponse: Decodable, Sendable {
    let id: String
    let lifetime_minutes: Int?
    let created_at: String?
    let expires_at: String?
    let auth: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, lifetime_minutes, created_at, expires_at, auth
    }
}

import Alamofire
import Foundation

final class SessionManager: Sendable {
    static let shared = SessionManager()
    private init() {}
    
    private let sessionKey = "com.myapp.session_id"
    private let accessKey = "com.myapp.access_token"
    private let refreshKey = "com.myapp.refresh_token"
    
    var currentSessionID: String? { KeychainWrapper.shared.get(forKey: sessionKey) }
    var accessToken: String? { KeychainWrapper.shared.get(forKey: accessKey) }
    var refreshToken: String? { KeychainWrapper.shared.get(forKey: refreshKey) }
    
    func fetchNewSession() async {
        let url = "https://interesnoitochka.ru/api/v1/auth/sessions/new"
        do {
            let response = try await AF.request(url)
                .serializingDecodable(SessionResponse.self)
                .value
            KeychainWrapper.shared.save(response.id, forKey: sessionKey)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func saveTokens(_ tokens: AuthTokens) {
        KeychainWrapper.shared.save(tokens.access_token, forKey: accessKey)
        KeychainWrapper.shared.save(tokens.refresh_token, forKey: refreshKey)
    }
}
