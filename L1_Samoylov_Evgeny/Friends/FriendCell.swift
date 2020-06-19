//
//  FriendCell.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 01.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendLabel: UILabel!
    
    @IBOutlet weak var friendAvatarShadow: FriendAvatarShadow!
    @IBAction func animateAvatar(){
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        let pulse = CASpringAnimation(keyPath: "transform.scale")
                        pulse.duration = 1
                        pulse.fromValue = 0.9
                        pulse.toValue = 1
                        pulse.autoreverses = false
                        pulse.repeatCount = 1
                        pulse.initialVelocity = 1
                        pulse.damping = 0.2
                        self.friendAvatarShadow.layer.add(pulse, forKey: nil)
        })
    }
    
}
