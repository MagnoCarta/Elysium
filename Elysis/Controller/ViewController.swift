//
//  ViewController.swift
//  Elysis
//
//  Created by Gilberto Magno on 08/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

// LEMBRANDO QUE ISSO CASO FAÇAMOS POR MEIO DO CODIGO , TAMBEM PDOEMOS FAZER POR STORYBOARD SE FOR VONTADE DE VOCES !!! AINDA USAMOS IB NESSA, APENAS COMPONETIZAMOS ELA

import Cocoa


extension NSWindow {
    
    
    open override var acceptsFirstResponder: Bool {
        
        get {   return true }
        
    }
    
    open override func becomeFirstResponder() -> Bool {
         return true
    }
    
    
    
    
}

class ViewController: NSViewController {
// VAMO CRIAR TODOS COMPONENTES QUE PODEM APARECER NAS TELA AQUI  ---------------------------------------------------------------------------

    let backg = NSImageView(image: NSImage(named: "BackgroundGame")!)
    var botaoImagem = NSImageView(image: NSImage(named: "capaDoLivroOficialProntoPronto")!)

    
    var historia = HistoryModel()
    

    
    
    

//-----------------------------------------------------------------------------
    override func loadView() {
        self.view  = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
         self.view.window?.acceptsMouseMovedEvents = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.backg)
        self.view.addSubview(botaoImagem)
        self.botaoImagem.frame.origin = CGPoint(x: self.view.frame.width/2 - 300, y: self.view.frame.height/2 - 300)
        self.botaoImagem.frame.size = CGSize(width: 600, height: 600)
        
        
        self.backg.translatesAutoresizingMaskIntoConstraints = false
        self.view.autoresizesSubviews = true
        self.backg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.backg.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        self.backg.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.backg.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.backg.imageScaling = .scaleAxesIndependently
        // Do any additional setup after loading the view.
    }
  
// TORNAR POSSÍVEL O CLIQUE DO JOGADOR!!!
    override func viewDidAppear() {

        
        
        
        
        view.window?.makeFirstResponder(self)
        view.window?.makeKey()
    }
    
    
    override func viewWillAppear() {
        super.viewWillAppear()
        //self.view.window!.acceptsMouseMovedEvents = true
    }
//QUANDO UMA TECLA É DO KEYBOARD É CLICADA! ------------------------------------------
    override func keyDown(with event: NSEvent) {
        //Se a tecla Espaço for clicada
        if event.keyCode == 36 {

            
            self.view.window?.contentViewController = PageViewController()
            
        }
   
        
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func mouseDown(with event: NSEvent) {
        
        self.view.window?.makeFirstResponder(self)
        self.view.window?.makeKey()
        
        if event.locationInWindow.y > self.botaoImagem.frame.minY && event.locationInWindow.y < self.botaoImagem.frame.maxY && event.locationInWindow.x > self.botaoImagem.frame.minX && event.locationInWindow.x < self.botaoImagem.frame.maxX {
            
            self.view.window?.contentViewController = PageViewController()
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        self.view.window?.close()
        //Pass data to new view
    }
    
    
    
}

