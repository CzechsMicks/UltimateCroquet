//
//  Player.swift
//  GolfCourse
//
//  Created by Jacob Osterloh on 4/19/17.
//  Copyright © 2017 Jacob Osterloh. All rights reserved.
//

import Foundation

class Player {
    
    var _email: String = "demoMan2"
    var _password: String = "bananas"
    
    //0: redBall2, 1: disco, 2: poke, 3: beach, 4: spotify, 
    //5: pandora, 6: vinyl, 7: youtube
    var _currentBall: Int = 0
    var _balls = [Bool](repeating: false, count: 8)
    
    var _levels = [Bool](repeating: false, count: 4)
    var _levelScores = [Int](repeating: -1, count: 4)
    
        
}
