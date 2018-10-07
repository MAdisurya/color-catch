//
//  ColorsEnum.swift
//  ColorCatch
//
//  Created by Mario Adisurya on 6/10/18.
//  Copyright © 2018 Mario Adisurya. All rights reserved.
//

public enum Colors: Int {
    case red, yellow, green, blue;
    
    mutating func next() {
        self = Colors(rawValue: rawValue + 1) ?? .red;
    }
    
    mutating func random() {
        var randomInt = Int.random(in: 0..<4);
        
        if (randomInt == rawValue) {
            randomInt = (randomInt < 3) ? randomInt + 1 : randomInt - 1;
        }
        
        self = Colors(rawValue: randomInt) ?? .red;
    }
}
