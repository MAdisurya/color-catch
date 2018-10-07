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
    private var highScoreLabel: SKLabelNode?;
    private var currentScoreLabel: SKLabelNode?;
    
    private var rootViewController: GameViewController?;
    
    override func didMove(to view: SKView) {
        self.label = self.childNode(withName: "//lets-play-label") as? SKLabelNode;
        self.highScoreLabel = self.childNode(withName: "//high-score-label") as? SKLabelNode;
        self.currentScoreLabel = self.childNode(withName: "//current-score-label") as? SKLabelNode;
        self.rootViewController = self.view?.window?.rootViewController as? GameViewController;
        
        updateScoreLabels();
        
        if let label = self.label {
            label.isUserInteractionEnabled = false;
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch;
        let positionInScene = touch.location(in: self);
        let touchedNode = self.atPoint(positionInScene);
        
        if let name = touchedNode.name {
            if (name == "lets-play-label") {
                let transition = SKTransition.reveal(with: .down, duration: 1);
                
                self.rootViewController?.goToScene(sceneName: "GameScene", transition: transition);
            }
            
            if (name == "quit-label") {
                exit(0);
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if (self.rootViewController == nil) {
            self.rootViewController = self.view?.window?.rootViewController as? GameViewController;
        } else {
            updateScoreLabels();
        }
    }
    
    private func updateScoreLabels() -> Void {
        if let highScore = self.rootViewController?.highScore,
            let currentScore = self.rootViewController?.score {
            highScoreLabel?.text = "High Score: " + String(highScore);
            currentScoreLabel?.text = "Current Score: " + String(currentScore);
        }
    }
}
