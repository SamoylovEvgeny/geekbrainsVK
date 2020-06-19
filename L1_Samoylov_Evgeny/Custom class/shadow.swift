//
//  shadow.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 07.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
@IBDesignable
class FriendAvatarShadow: UIView {
    @IBInspectable
    var shadowColor: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable
    var shadowRadius: Float {
        get {
            return Float(layer.shadowRadius)
        }
        set {
            layer.shadowRadius = CGFloat(newValue)
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 1
        pulse.toValue = 1.1
        pulse.autoreverses = false
        pulse.initialVelocity = 0.3
        pulse.damping = 0.5
        layer.add(pulse, forKey: nil)
    }
}
class FriendAvatarImage: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews ()
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
        
    }
    
    
}
