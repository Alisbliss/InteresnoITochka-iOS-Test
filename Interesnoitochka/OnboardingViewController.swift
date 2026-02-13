//
//  ViewController.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 12.02.2026.
//

import UIKit
import SwiftUI
import SnapKit

class OnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#25282D")
        setupSwiftUI()
    }
    
    private func setupSwiftUI() {
        let swiftUIView = OnBoardingSwiftUI { [weak self] in
            self?.goToRegistrationScreen()
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
    
    func goToRegistrationScreen() {
        let registrationVC = RegistrationViewController()
        self.navigationController?.pushViewController(registrationVC, animated: true)
    }
}
