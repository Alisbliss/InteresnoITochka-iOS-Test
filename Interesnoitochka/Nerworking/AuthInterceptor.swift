//
//  AuthInterceptor.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 13.02.2026.
//
import Foundation
import Alamofire

final class AuthInterceptor: RequestInterceptor, Sendable {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        let manager = SessionManager.shared
        
        
        if let token = manager.accessToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        else if let sessionId = manager.currentSessionID {
            request.setValue(sessionId, forHTTPHeaderField: "X-Session-ID")
        }
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        guard let response = request.task?.response as? HTTPURLResponse,
              response.statusCode == 401,
              let refreshToken = SessionManager.shared.refreshToken else {
            return completion(.doNotRetry)
        }
        
        let parameters = ["token": refreshToken]
        AF.request("https://interesnoitochka.ru/api/v1/auth/jwt/refresh/new",
                   method: .post,
                   parameters: parameters,
                   encoder: URLEncodedFormParameterEncoder.default)
        .validate()
        .responseDecodable(of: AuthTokens.self) { response in
            switch response.result {
            case .success(let tokens):
                SessionManager.shared.saveTokens(tokens)
                print("Токены обновлены")
                completion(.retry)
            case .failure:
                completion(.doNotRetry)
            }
        }
    }
}
