//
//  ParallaxScreen2ViewController.swift
//  ParallaxView
//
//  Created by Devank on 30/06/24.
//

import UIKit

class ParallaxScreen2ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            
            let backgroundImage = UIImageView(image: UIImage(named: "bg_forest"))
            backgroundImage.contentMode = .scaleAspectFill
            backgroundImage.translatesAutoresizingMaskIntoConstraints = false
            
            let textLabel = UILabel()
            textLabel.text = "Thank you for considering me for the Mobile Engineer II role at Zocdoc. I am excited about the opportunity to join such a well-established and innovative company in the healthcare domain."
        
            textLabel.font = UIFont(name: "Courgette-Regular", size: 18)
            textLabel.textColor = .white
            textLabel.textAlignment = .center
            textLabel.numberOfLines = 0
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(backgroundImage)
            view.addSubview(textLabel)
            
            NSLayoutConstraint.activate([
                backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
                textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90)
            ])
        }

}
