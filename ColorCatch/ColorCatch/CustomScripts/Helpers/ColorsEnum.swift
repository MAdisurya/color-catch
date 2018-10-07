//
//  ColorsEnum.swift
//  ColorCatch
//
//  Created by Mario Adisurya on 6/10/18.
//  Copyright © 2018 Mario Adisurya. All rights reserved.
//

import GameplayKit;

public enum Colors: Int {
    case red, yellow, green, blue;
    
    mutating func next() {
        self = Colors(rawValue: rawValue + 1) ?? .red;
    }
    
    mutating func back() {
        self = Colors(rawValue: rawValue - 1) ?? .blue;
    }
    
    mutating func random() {
        var randomInt = arc4random_uniform(4);
        
        if (randomInt == rawValue) {
            randomInt = (randomInt < 3) ? randomInt + 1 : randomInt - 1;
        }
        
        self = Colors(rawValue: Int(randomInt)) ?? .red;
    }
}
