//
//  ParallaxScreen1ViewController.swift
//  ParallaxView
//
//  Created by Devank on 30/06/24.
//

import UIKit

class ParallaxScreen1ViewController: UIViewController {
    private var isCardExpanded = false
     
     private let backgroundImageView: UIImageView = {
         let imageView = UIImageView(image: UIImage(named: "bg_galaxy"))
         imageView.contentMode = .scaleAspectFill
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
     
     private let foregroundImageView: UIImageView = {
         let imageView = UIImageView(image: UIImage(named: "fg_landscape_night"))
         imageView.contentMode = .scaleAspectFill
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
     
     private lazy var cardView: UIView = {
         let view = UIView()
         view.backgroundColor = .clear
         view.layer.borderWidth = 2
         view.layer.borderColor = UIColor.white.cgColor
         view.layer.cornerRadius = 16
         view.translatesAutoresizingMaskIntoConstraints = false
         view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCardTap)))
         return view
     }()
     
     private let titleLabel: UILabel = {
         let label = UILabel()
         label.text = "Card Title"
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     private let arrowImageView: UIImageView = {
         let imageView = UIImageView(image: UIImage(systemName: "chevron.down"))
         imageView.tintColor = .white
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
     
     private let descriptionLabel: UILabel = {
         let label = UILabel()
         label.text = "This is the card description. It should be visible when the card is expanded.This is the card description. It should be visible"
         label.textColor = .white
         label.numberOfLines = 0
         label.isHidden = true
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     private var cardViewHeightConstraint: NSLayoutConstraint!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         setupUI()
     }
     
     private func setupUI() {
         view.backgroundColor = .black
         
         // Background Image View
         view.addSubview(backgroundImageView)
         
         // Foreground Image View
         view.addSubview(foregroundImageView)
         
         // Card View
         view.addSubview(cardView)
         
         // Card Subviews
         cardView.addSubview(titleLabel)
         cardView.addSubview(arrowImageView)
         cardView.addSubview(descriptionLabel)
         
         // Constraints for Background Image
         NSLayoutConstraint.activate([
             backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
             backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
         
         // Constraints for Foreground Image
         NSLayoutConstraint.activate([
             foregroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             foregroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             foregroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             foregroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
         ])
         
         // Constraints for Card View
         cardViewHeightConstraint = cardView.heightAnchor.constraint(equalToConstant: 60)
         cardViewHeightConstraint.isActive = true
         
         NSLayoutConstraint.activate([
             cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             cardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
         ])
         
         // Constraints for Card Subviews
         NSLayoutConstraint.activate([
             // Title Label Constraints
             titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
             titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
             
             // Arrow Image View Constraints
             arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
             arrowImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
             
             // Description Label Constraints
             descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
             descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
             descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
             descriptionLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
         ])
     }
     
     @objc private func handleCardTap() {
         isCardExpanded.toggle()
         
         UIView.animate(withDuration: 0.3) {
             self.arrowImageView.transform = self.isCardExpanded ? CGAffineTransform(rotationAngle: .pi) : .identity
             self.cardViewHeightConstraint.constant = self.isCardExpanded ? 200 : 60
             self.descriptionLabel.isHidden = !self.isCardExpanded
             self.view.layoutIfNeeded()
         }
     }
}
