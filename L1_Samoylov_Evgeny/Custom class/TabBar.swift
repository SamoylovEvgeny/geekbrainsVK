//
//  TabBar.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 01.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit

class TabBar: UITabBar {
    override func awakeFromNib() {
        superview?.awakeFromNib()
        unselectedItemTintColor = .systemOrange
    }
}
