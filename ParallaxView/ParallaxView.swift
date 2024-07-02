//
//  ParallaxView.swift
//  ParallaxView
//
//  Created by Devank on 30/06/24.
//

import Foundation
import UIKit

class ParallaxImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        setupParallaxEffect()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupParallaxEffect()
    }
    
    private func setupParallaxEffect() {
        let min = CGFloat(-20) // Adjust for minimal parallax effect
        let max = CGFloat(20) // Adjust for maximal parallax effect
        
        // Horizontal motion effect
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        // Vertical motion effect
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        // Grouping motion effects
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion, yMotion]
        
        self.addMotionEffect(group)
    }
}
