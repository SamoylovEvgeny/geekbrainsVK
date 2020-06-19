//
//  session.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 11.05.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit

class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var token: String = ""
    var userId: Int = 0

}
