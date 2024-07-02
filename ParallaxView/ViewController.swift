//
//  ViewController.swift
//  ParallaxView
//
//  Created by Devank on 30/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 16
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            let button1 = UIButton(type: .system)
            button1.setTitle("Parallax Screen 1", for: .normal)
            button1.addTarget(self, action: #selector(navigateToParallaxScreen1), for: .touchUpInside)
            
            let button2 = UIButton(type: .system)
            button2.setTitle("Parallax Screen 2", for: .normal)
            button2.addTarget(self, action: #selector(navigateToParallaxScreen2), for: .touchUpInside)
            
            stackView.addArrangedSubview(button1)
            stackView.addArrangedSubview(button2)
            
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        @objc func navigateToParallaxScreen1() {
            let parallaxScreen1VC = ParallaxScreen1ViewController()
            navigationController?.pushViewController(parallaxScreen1VC, animated: true)
        }
        
        @objc func navigateToParallaxScreen2() {
            let parallaxScreen2VC = ParallaxScreen2ViewController()
            navigationController?.pushViewController(parallaxScreen2VC, animated: true)
        }
}

