//
//  ColorWheel.swift
//  ColorCatch
//
//  Created by Mario Adisurya on 6/10/18.
//  Copyright © 2018 Mario Adisurya. All rights reserved.
//

import Foundation
import SpriteKit

class ColorWheel: SKSpriteNode {
    
    var currentColor: Colors = .red;
    
    func rotateWheel(angle: CGFloat) -> Void {
        let rotateAction = SKAction.rotate(byAngle: angle, duration: 0.1);
        
        self.run(rotateAction);
        
        currentColor.next();
    }
}
