//
//  GameViewController.swift
//  ColorCatch
//
//  Created by Mario Adisurya on 1/10/18.
//  Copyright © 2018 Mario Adisurya. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    public var score: Int = 0;
    public var highScore: Int = 0;
    
    private let userDefaults = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        highScore = userDefaults.integer(forKey: "highScore");
        score = 0;
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "MainMenuScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return false;
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    public func goToScene(sceneName: String, transition: SKTransition) {
        if let view = self.view as! SKView? {
            if let newScene = SKScene(fileNamed: sceneName) {
                newScene.scaleMode = .aspectFill;
                view.presentScene(newScene, transition: transition);
            }
        }
    }
    
    public func updateScore(to score: Int) {
        self.score = score;
        
        if (score > highScore) {
            highScore = score;
            userDefaults.set(score, forKey: "highScore");
        }
    }
    
    public func getHighScore() -> Int {
        return highScore;
    }
    
    public func getCurrentScore() -> Int {
        return score;
    }
}
