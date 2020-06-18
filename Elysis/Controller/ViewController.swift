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
// VAMO CRIAR TODOS COMPONENTES QUE PODEM APARECER NAS TELA AQUI  ---------------------------------------------------------------------------
    
    
    var respostaApi = ApiController()
//    var cover = CoverAnimation()
    
    
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
            //self.view.window?.contentViewController = AnimationController()
        
            print("oi")
      
        }

    }
        
        
        
        
    
//------------------------------------------------------------------------------------
    
    
    
    
    
    
    
    
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
    
    
    
    
}

