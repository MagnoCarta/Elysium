//
//  PageViewController.swift
//  Elysis
//
//  Created by Gilberto Magno on 11/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//


import Cocoa



extension NSView {
    open override var acceptsFirstResponder: Bool {
        get { return true }
    }
}

class PageViewController: NSViewController , NSPageControllerDelegate {
    
    
    let PaginaPrincipal = NSImageView(image: NSImage(named: "LivroCompletoAberto")!)
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var numeroDoTextoAtual = 0
    var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var xConstraint: NSLayoutConstraint =   NSLayoutConstraint()
    var heightConstraint1: NSLayoutConstraint = NSLayoutConstraint()
    var xConstraint1: NSLayoutConstraint =   NSLayoutConstraint()
    let paginasDireitas : [PaginaDireita] = [PaginaDireita()]
    let paginasEsquerdas : [PaginaEsquerda] = [PaginaEsquerda()]
    var numeroDaPaginaAtual = 0
    var arrayDeNumeroDeTextosPorPagina: [Int] = []
    
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = .init(red: 255, green: 60/255, blue: 60/255, alpha: 0.8)
        self.view.window?.acceptsMouseMovedEvents = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dobradissa = paginasDireitas[0].pontaDaPaginaDireita else { return }
        dobradissa.action = #selector(virarPagina(_:))
        guard let dobradissaEsquerda = paginasEsquerdas[0].pontaDaPaginaEsquerda else { return }
        dobradissaEsquerda.action = #selector(virarPagina(_:))

            organizarTela(dobradissa: dobradissa, dobradissaEsquerda: dobradissaEsquerda)
        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
            
            dobradissa.dobrarPontaDaPagina(mouseLocation: self.mouseLocation, xConstraint: self.xConstraint, heightConstraint: self.heightConstraint,constantHeight: 1,xConstant: 0.48)
            dobradissaEsquerda.dobrarPontaDaPagina(mouseLocation: self.mouseLocation, xConstraint: self.xConstraint1, heightConstraint: self.heightConstraint1,constantHeight: 1,xConstant: -0.48)
            
            
         return $0 }
        
        
        
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.makeFirstResponder(self)
        self.view.window?.makeKey()
    
    }
    
    
    
    
    func MagnoAnimation(_ imagens: [NSImageView],time: TimeInterval) {
        
    }
    
    
    override func keyDown(with event: NSEvent) {
    
        
        
        if event.keyCode == 36 {
           
            self.paginasDireitas[0].texto.proximoTextoNaTelaASerMostrado(speed: 70, controler: self, numeroDoTextoAtual: self.paginasDireitas[0].texto.numeroDoTextoAtual)
            
            
        }
            
             
            
        }
        
    
    
    override func keyUp(with event: NSEvent) {
        
    }
    

    @objc func virarPagina(_ Button: PontaDaPaginaAnimada) {
        
        if  Button.lado {
            numeroDaPaginaAtual -= 1
            
            
            
            
        }else {
            print("a")
            arrayDeNumeroDeTextosPorPagina.append(numeroDoTextoAtual)
            reorganizarConstraints(numeroDaPagina: numeroDaPaginaAtual, dobradissa: paginasDireitas[numeroDaPaginaAtual].pontaDaPaginaDireita!, dobradissaEsquerda: paginasEsquerdas[numeroDaPaginaAtual].pontaDaPaginaEsquerda!, lado: Button.lado)
            
            numeroDaPaginaAtual += 1
        }
        
    }
    
}
