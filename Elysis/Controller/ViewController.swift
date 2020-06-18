//
//  ViewController.swift
//  Elysis
//
//  Created by Gilberto Magno on 08/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

// LEMBRANDO QUE ISSO CASO FAÇAMOS POR MEIO DO CODIGO , TAMBEM PDOEMOS FAZER POR STORYBOARD SE FOR VONTADE DE VOCES !!! AINDA USAMOS IB NESSA, APENAS COMPONETIZAMOS ELA

import Cocoa
import SpriteKit

class ViewController: NSViewController {
// VAMOS CRIAR TODOS COMPONENTES QUE PODEM APARECER NAS TELAS AQUI  ---------------------------------------------------------------------------
    
    var buttonCover = NSButton()
    
    private lazy var background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "BackgroundGame")
        background.position = NSPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        background.size = CGSize(width: 1280, height: 800)
        background.zPosition = 0
        return background
    }()
    
//-----------------------------------------------------------------------------
    
    override func loadView() {
        self.view  = SKView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
// TORNAR POSSÍVEL O CLIQUE DO JOGADOR!!!
    override func viewDidAppear() {
        view.window?.makeFirstResponder(self)
        view.window?.makeKey()
    }
    
    
//QUANDO UMA TECLA É DO KEYBOARD É CLICADA! ------------------------------------------
    override func keyDown(with event: NSEvent) {

        //Se a tecla Enter for clicada
        if event.keyCode == 36 {
            print("oi")
      
        }

    }

//------------------------------------------------------------------------------------

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func ButtonSettings() {
        self.view.addSubview(buttonCover)
        
        buttonCover.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            buttonCover.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonCover.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            //buttonCover.widthAnchor.constraint(equalToConstant: ),
            buttonCover.heightAnchor.constraint(equalToConstant: 800)
        ]
        NSLayoutConstraint.activate(constraints)
        
        buttonCover.isBordered = false
        buttonCover.image = NSImage(named: "capaDoLivroOficialProntoPronto")
        buttonCover.imageScaling = .scaleProportionallyUpOrDown
        fadeIn()
        
    }
    
    func fadeIn(){
        NSAnimationContext.runAnimationGroup({ (context) in
          context.duration = 1.0
          buttonCover.animator().alphaValue = 0
        })
    }
 
    
}

//    override func didMove(to view: SKView) {
//        addChild(background)
//       // let animation = SKAction.animate(with: <#T##[SKTexture]#>, timePerFrame: <#T##TimeInterval#>)
//        //background.run(animation)
//    }

//import Cocoa
//import SpriteKit
//import GameplayKit
//
//class ViewController: NSViewController {
//
//    @IBOutlet var skView: SKView!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
//        // including entities and graphs.
//        if let scene = GKScene(fileNamed: "GameScene") {
//
//            // Get the SKScene from the loaded GKScene
//            if let sceneNode = scene.rootNode as! GameScene? {
//
//                // Copy gameplay related content over to the scene
//                sceneNode.entities = scene.entities
//                sceneNode.graphs = scene.graphs
//
//                // Set the scale mode to scale to fit the window
//                sceneNode.scaleMode = .aspectFill
//
//                // Present the scene
//                if let view = self.skView {
//                   // sceneNode.size = skView.bounds.size
//                    view.presentScene(sceneNode)
//
//                    view.ignoresSiblingOrder = true
//
//                    view.showsFPS = true
//                    view.showsNodeCount = true
//                }
//            }
//        }
//    }
//}
