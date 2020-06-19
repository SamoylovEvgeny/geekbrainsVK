//
//  group.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 02.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
struct Group {
    var name: String
    var avatar: UIImage
}
extension Group : Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        lhs.name == rhs.name && lhs.avatar == rhs.avatar
    }
}
