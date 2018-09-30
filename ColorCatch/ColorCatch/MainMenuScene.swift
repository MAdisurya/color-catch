//
//  GameScene.swift
//  ColorCatch
//
//  Created by Mario Adisurya on 1/10/18.
//  Copyright © 2018 Mario Adisurya. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenuScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        self.label = self.childNode(withName: "//letsPlayLabel") as? SKLabelNode;
        
        if let label = self.label {
            label.isUserInteractionEnabled = false;
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch;
        let positionInScene = touch.location(in: self);
        let touchedNode = self.atPoint(positionInScene);
        
        if let name = touchedNode.name {
            if (name == "letsPlayLabel") {
                let currentViewController = self.view?.window?.rootViewController as? GameViewController;
                let transition = SKTransition.reveal(with: .down, duration: 1);
                
                currentViewController?.goToScene(sceneName: "GameScene", transition: transition);
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
