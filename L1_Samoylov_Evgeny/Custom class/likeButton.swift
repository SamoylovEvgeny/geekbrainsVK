//
//  likeButton.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 09.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
class LikeButton: UIButton {
    
    var liked: Bool = false
    
    var likeCount = 0
    
    @objc func like() {
        liked.toggle()
        if liked {
            setLike()
        }
        else {
            cancelLike()
        }
        setTitle("\(likeCount)", for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDefault()
    }
    
    private func setupDefault() {
        setImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = .systemOrange
        setTitle("\(likeCount)", for: .normal)
        addTarget(self, action: #selector(like), for: .touchUpInside )
    }
    
    func setLike() {
        setImage(UIImage(systemName: "heart.fill"), for: .normal)
        tintColor = .systemRed
        likeCount += 1
        pulsateLike()
    }
    func cancelLike() {
        setImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = .systemOrange
        likeCount -= 1
        pulsateCancelLike()
    }
    
    func pulsateLike() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 1
        pulse.toValue = 1.1
        pulse.autoreverses = false
        pulse.initialVelocity = 0.3
        pulse.damping = 0.5
        layer.add(pulse, forKey: nil)
    }
    func pulsateCancelLike() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 1
        pulse.toValue = 0.9
        pulse.autoreverses = false
        pulse.initialVelocity = 0.3
        pulse.damping = 0.5
        layer.add(pulse, forKey: nil)
    }
}
