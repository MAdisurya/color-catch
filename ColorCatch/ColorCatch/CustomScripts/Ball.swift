//
//  Ball.swift
//  ColorCatch
//
//  Created by Mario Adisurya on 6/10/18.
//  Copyright © 2018 Mario Adisurya. All rights reserved.
//

import SpriteKit
import Foundation

class Ball: SKSpriteNode {
    
    var currentColor: Colors = .red;
    
    public func animateBallFalling(speed amount: CGFloat) -> Void {
        self.position = CGPoint(x: self.position.x, y: self.position.y + amount);
    }
    
    public func changeColor() -> Void {
        currentColor.random();
        
        switch currentColor {
            case .red:
                self.texture = SKTexture(imageNamed: "red");
                break;
            case .yellow:
                self.texture = SKTexture(imageNamed: "yellow");
                break;
            case .green:
                self.texture = SKTexture(imageNamed: "green");
                break;
            case .blue:
                self.texture = SKTexture(imageNamed: "blue");
                break;
        }
    }
}
