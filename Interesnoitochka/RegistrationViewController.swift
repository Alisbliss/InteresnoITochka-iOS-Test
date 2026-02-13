//
//  RegistrationViewController.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 13.02.2026.
//

import UIKit
import SwiftUI
import SnapKit

class RegistrationViewController: UIViewController {
    
    private let sessionManager = SessionManager.shared
    private let authWebSocket = AuthWebSocketManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#25282D")
        setupSwiftUI()
    }
    
    private func setupSwiftUI() {
        let swiftUIView = RegistrationView { [weak self] in
            self?.handleRegistrationTap()
        }
        
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.backgroundColor = .clear
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func handleRegistrationTap() {
        Task {
            
            if sessionManager.currentSessionID == nil {
                await sessionManager.fetchNewSession()
            }
            
            guard let sessionId = sessionManager.currentSessionID else {
                return
            }
            
            authWebSocket.connect(sessionId: sessionId) { [weak self] tokens in
                DispatchQueue.main.async {
                    self?.sessionManager.saveTokens(tokens)
                    self?.goToMainScreen()
                }
            }
            
            let botUsername = "chatttinnngggbot"
            if let url = URL(string: "https://t.me/\(botUsername)?start=\(sessionId)") {
                await UIApplication.shared.open(url)
            }
        }
    }
    
    func goToMainScreen() {
        let mainVC = MainViewController()
        self.navigationController?.setViewControllers([mainVC], animated: true)
    }
}
