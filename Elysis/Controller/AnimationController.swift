//
//  AnimationController.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 12/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//


import Cocoa
import SpriteKit

extension NSView {
    
    open override var acceptsFirstResponder: Bool {
        get { return true }
    }
    
}

class AnimationController: NSViewController{

    var buttonCover = NSButton()
    
    private lazy var background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "BackgroundGame")
        background.position = NSPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        background.size = CGSize(width: 1280, height: 800)
        background.zPosition = 0
        return background
    }()
    
    override func loadView() {
        self.view  = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonSettings()
            
    }
    
    override func viewDidAppear() {
        self.view.window?.makeFirstResponder(self)// Faz a window responder à view atual
        self.view.window?.makeKey() // Reconhece o keyboard
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
