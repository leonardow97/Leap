//
//  GameViewController.swift
//  Leap
//
//  Created by Leonardo Walcher on 28-09-2016.
//  Copyright © 2016 LWGames. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
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
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        
        return UIInterfaceOrientationMask.portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func handleApplicationWillResignActive (_ note: Notification) {
        
        let skView = self.view as! SKView
        skView.isPaused = true
    }
    
    func handleApplicationDidBecomeActive (_ note: Notification) {
        
        let skView = self.view as! SKView
        skView.isPaused = false
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
}
