//
//  GameScene.swift
//  ColorCatch
//
//  Created by Mario Adisurya on 1/10/18.
//  Copyright © 2018 Mario Adisurya. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var scoreLabel: SKLabelNode?;
    private var ball: Ball?;
    private var colorWheel: ColorWheel?;
    private var checker: SKNode?;
    private var rootViewController: GameViewController?;
    
    private var currentScore: Int = 0;
    
    private var currentSpeed: CGFloat = 4;
    private let ballStartPos: CGPoint = CGPoint(x: 0, y: 400);
    
    override func didMove(to view: SKView) {
        self.scoreLabel = self.childNode(withName: "//score-label") as? SKLabelNode;
        self.ball = self.childNode(withName: "//ball") as? Ball;
        self.colorWheel = self.childNode(withName: "//color-wheel") as? ColorWheel;
        self.checker = self.childNode(withName: "//checker");
        
        self.rootViewController = self.view?.window?.rootViewController as? GameViewController;
    }
    
    override func update(_ currentTime: TimeInterval) {
        ball?.animateBallFalling(speed: -currentSpeed);
        
        if let ballPos = ball?.position, let checkerPos = checker?.position {
            if (ballPos.y <= checkerPos.y) {
                if (ball?.currentColor != colorWheel?.currentColor) {
                    ball?.removeFromParent();
                    self.ball = nil;
                    
                    self.rootViewController?.updateScore(to: currentScore);
                    
                    let transition = SKTransition.reveal(with: .up, duration: 1);
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                        self.rootViewController?.goToScene(sceneName: "MainMenuScene",
                                                      transition: transition);
                    }
                }
            }
            
            if let colorWheelPos = colorWheel?.position {
                if (ballPos.y <= colorWheelPos.y) {
                    incrementScore();
                    spawnBall(ball: self.ball!);
                }
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        colorWheel?.rotateWheel(angle: CGFloat(Double.pi / 2));
    }
    
    private func spawnBall(ball: Ball) -> Void {
        ball.position = ballStartPos;
        ball.changeColor();
    }
    
    private func incrementScore() -> Void {
        changeSpeed(to: currentSpeed + 0.25);
        currentScore += 1;
        scoreLabel?.text = String(currentScore);
    }
    
    private func changeSpeed(to speed: CGFloat) {
        currentSpeed = speed;
    }
}
