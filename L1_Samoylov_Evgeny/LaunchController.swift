//
//  LaunchController.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 19.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit

class Dot: UIView {
    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 2
        backgroundColor = .systemOrange
    }
}

class LaunchController: UIViewController {
    
    @IBOutlet weak var dotOne: UIView!
    @IBOutlet weak var dotTwo: UIView!
    @IBOutlet weak var dotThree: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.dotOne.backgroundColor = .darkGray

        })
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [.autoreverse, .repeat], animations: {
            self.dotTwo.backgroundColor = .darkGray
        })
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [.autoreverse, .repeat], animations: {
            self.dotThree.backgroundColor = .darkGray
        })
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3, execute: {
            self.dotOne.layer.removeAllAnimations()
            self.dotTwo.layer.removeAllAnimations()
            self.dotThree.layer.removeAllAnimations()
            self.performSegue(withIdentifier: "login", sender: self)
        })
    }
}

