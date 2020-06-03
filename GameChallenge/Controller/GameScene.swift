//
//  GameScene.swift
//  GameChallenge
//
//  Created by Rodrigo Matos Aguiar on 02/06/20.
//  Copyright © 2020 Placeholder. All rights reserved.
//

import SpriteKit
import GameplayKit
import Carbon.HIToolbox // ajudar nossa vida no movimento, não é necessário mas ajuda



//auxiliares para me ajudar indentificar teclas pressionadas
var leftPressed = false
var rightPressed = false
var upPressed = false
var downPressed = false








class GameScene: SKScene {
    // Ajudam no tratamento do tempo e fps
    var renderTime: TimeInterval = 0.0
    var ChangeTime: TimeInterval = 1/60
    
    //vou deixar aqui essa auxiliar temporaria , pode ajudar pra acelerecao e coisas do tipo saber tempo de tecla pressionado
    var holdingKey: [CGFloat] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    //Como isso ainda tá estruturado e é só uma vaga ideia por enquanto , vou deixar da seguinte maneira
    //H = holdingKey
    // LEFT H[0]
    // RIGHT H[1]
    // UP H[2]
    // DOWN H[3]
    // Oque isso significa? Isso irá ajudar na hora de chamar a função que interfere no holdingkey , a segurar(x : Int), sendo esse x  esse valor dentro do []
    
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func mouseDown(with event: NSEvent) {
        
        let location = event.location(in: self) //Pego a localização Onde o usuário clicou! com isso posso me perguntar o que cliquei!
        
        
        
        }
    
    override func mouseDragged(with event: NSEvent) {
        }
    
    override func mouseUp(with event: NSEvent) {
        }
    
    
    
    
    override func keyDown(with event: NSEvent) {
           
           // Sabemos se a tecla foi clicada aqui :D
           
           switch Int(event.keyCode) {
               
           case kVK_LeftArrow:
               leftPressed = true
               
           case kVK_RightArrow:
               rightPressed = true
               
           case kVK_UpArrow:
               upPressed = true
               
           case kVK_DownArrow:
               downPressed = true
               
           default:
               break
               
           }
           
           
       }
    
    
    
    
    override func keyUp(with event: NSEvent) {
        
        // Parou de clicar, a gente retorna ao padrão as teclas, nada pressionado, nada segurado!
            switch Int(event.keyCode) {
        
            case kVK_LeftArrow:
                
                leftPressed = false
                holdingKey[0] = 0
                
            case kVK_RightArrow:
                
                rightPressed = false
                holdingKey[1] = 0
                
            case kVK_UpArrow:
                
                upPressed = false
                holdingKey[2] = 0
                
            case kVK_DownArrow:
                
                downPressed = false
                holdingKey[3] = 0
                
            default:
                break
            }
        
    }
    
    
    
    
   
    
    
    override func update(_ currentTime: TimeInterval) {
        
        // como eu disse, isso aqui pode ajudar a tornar as coisas mais realisticas, uma aceleração, aqui podemos ver quanto tempo uma tecla está sendo segurada, de maneira só estruturada por enquanto
        
        func segurar(x: Int) {
            
        if currentTime > renderTime {
            
            if renderTime > -1 {
                
                if self.holdingKey[x] < 2 {
                    
                self.holdingKey[x] += CGFloat(ChangeTime)
                    print(self.holdingKey[x])
                    
                    }
                
                }
            
                renderTime = currentTime + ChangeTime
            }
        }
        
        
        if leftPressed {segurar(x: 0)}
        if rightPressed {segurar(x: 1)}
        if upPressed {segurar(x: 2)}
        if downPressed {segurar(x: 3)}
        
        
    }
}
