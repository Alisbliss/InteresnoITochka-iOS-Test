//
//  AuthTokens.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 13.02.2026.
//

nonisolated struct AuthTokens: Codable, Sendable {
    let access_token: String
    let refresh_token: String
}
