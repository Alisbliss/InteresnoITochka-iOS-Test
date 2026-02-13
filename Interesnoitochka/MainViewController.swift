//
//  MainViewController.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 13.02.2026.
//
import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "HOME"
        label.font = .systemFont(ofSize: 64, weight: .black)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#25282D")
    }
    
    private func setupLayout() {
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
