//
//  coverAnimation.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 17/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import SpriteKit
//import GameplayKit

class CoverAnimation: SKScene {
    
    private lazy var background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "BackgroundGame")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: 1280, height: 800)
        background.zPosition = 0
        return background
    }()
    
    override func didMove(to view: SKView) {
        addChild(background)
       // let animation = SKAction.animate(with: <#T##[SKTexture]#>, timePerFrame: <#T##TimeInterval#>)
        //background.run(animation)
    }
}
