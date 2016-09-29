//
//  GameScene.swift
//  Leap
//
//  Created by Leonardo Walcher on 28-09-2016.
//  Copyright © 2016 LWGames. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    var rect: SKSpriteNode!
    var bullet: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        drawRect()
        PhyWorld()
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.view?.backgroundColor = UIColor(red: 21.0/255.0, green: 184/255.0, blue: 191/255.0, alpha: 0)
    }
    
    
    func drawRect() {
        rect = SKSpriteNode(color: UIColor.black, size: CGSize(width: 120, height: 200))
        rect.position = CGPoint(x: self.frame.midX, y: -self.size.height/6)
        rect.zPosition = 0
        rect.physicsBody = SKPhysicsBody(rectangleOf: rect.frame.size)
        rect.physicsBody!.allowsRotation = false
        rect.physicsBody!.affectedByGravity = false
        rect.physicsBody!.isDynamic = true
        rect.physicsBody!.linearDamping = 0.5
        
        self.addChild(rect)
    }
    
    func PhyWorld() {
        let worldBorder = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody!.friction = 0
        self.physicsBody = worldBorder
    }
    
    func drawBullets() {
        bullet = SKSpriteNode(color: UIColor.black, size: CGSize(width: 20, height: 20))
        bullet.position = CGPoint(x: rect.position.x, y: rect.position.y)
        bullet.zPosition = -5
        let bulletMovement = SKAction.moveTo(y: self.size.height + 30, duration: 0.6)
        bullet.run(SKAction.repeatForever(bulletMovement))
        self.addChild(bullet)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            rect.position.x = location.x
            drawBullets()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            rect.position.x = location.x
            drawBullets()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
