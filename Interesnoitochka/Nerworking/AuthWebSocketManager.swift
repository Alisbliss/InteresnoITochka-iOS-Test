//
//  AuthWebSocketManager.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 13.02.2026.
//

import Foundation

final class AuthWebSocketManager: Sendable {
    
    func connect(sessionId: String, onTokenReceived: @escaping @Sendable (AuthTokens) -> Void) {
        let url = URL(string: "wss://interesnoitochka.ru/api/v1/ws/ws/session/\(sessionId)")!
        let session = URLSession(configuration: .ephemeral)
        let socket = session.webSocketTask(with: url)
        socket.resume()
        listenForTokens(socket: socket, completion: onTokenReceived)
    }
    
    private func listenForTokens(socket: URLSessionWebSocketTask, completion: @escaping @Sendable (AuthTokens) -> Void) {
        socket.receive { [weak self, weak socket] result in
            guard let socket = socket, let self = self else { return }
            
            switch result {
            case .success(let message):
                if case .string(let text) = message {
                    guard let data = text.data(using: .utf8) else {
                        self.listenForTokens(socket: socket, completion: completion)
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let tokens = try decoder.decode(AuthTokens.self, from: data)
                        print("Токены декодированы")
                        completion(tokens)
                        socket.cancel(with: .normalClosure, reason: nil)
                    } catch {
                        self.listenForTokens(socket: socket, completion: completion)
                    }
                }
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
