//
//  AnimationController.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 12/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//


import Cocoa

extension NSView {
    
    open override var acceptsFirstResponder: Bool {
        get { return true }
    }
    
}

class AnimationController: NSViewController{

    
    var transformLayer: CALayer!

    override func loadView() {
        self.view  = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true //Indica se a exibição usa um layer como armazenamento de suporte
        transformLayer = CALayer()
        transformLayer.frame = view.bounds.insetBy(dx: 50, dy: 50)
        transformLayer.backgroundColor = NSColor.white.cgColor
        view.layer?.addSublayer(transformLayer)
    }

    override func viewDidAppear() {
        self.view.window?.makeFirstResponder(self)// Faz a window responder à view atual
        self.view.window?.makeKey() // Reconhece o keyboard
    }

    override func keyDown(with event: NSEvent) {
        print(event.keyCode)
        if event.keyCode == 123 { //Seta esquerda
            setAngle(degrees: 45)
        } else if event.keyCode == 124 { //Seta direita
            setAngle(degrees: -45)
        }
    }

    func setAngle(degrees: CGFloat){
        let radians = CGFloat(Double.pi) * degrees / 180.0
        var transform = CATransform3DIdentity
        transform.m34 = 1 / -25 //Indica a profundidade da animação
        transform = CATransform3DRotate(transform, radians, 0, 1, 0)
        transformLayer.transform = transform
    }
    
}
