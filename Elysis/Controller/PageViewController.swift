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
    
    
    let PaginaPrincipal = NSImageView(image: NSImage(named: "TelaDePagina")!)
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var numeroDoTextoAtual = 0
    var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var xConstraint: NSLayoutConstraint =   NSLayoutConstraint()
    var heightConstraint1: NSLayoutConstraint = NSLayoutConstraint()
    var xConstraint1: NSLayoutConstraint =   NSLayoutConstraint()
    var numeroDaPaginaAtual = 0
    var arrayDeNumeroDeTextosPorPagina: [Int] = []
    var paginas = [Pagina()]
    var numeroDePaginas = 1
    let textoTeste = NSText(frame: NSRect(x: 20, y: 20, width: 385, height: 30))
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = .init(red: 252/255, green: 58/255, blue: 58/255, alpha: 1)
        self.view.window?.acceptsMouseMovedEvents = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dobradissa = paginas[0].pontaDaPaginaDireita else { return }
        dobradissa.action = #selector(virarPagina(_:))
        guard let dobradissaEsquerda = paginas[0].pontaDaPaginaEsquerda else { return }
        dobradissaEsquerda.action = #selector(virarPagina(_:))

            organizarTela(dobradissa: dobradissa, dobradissaEsquerda: dobradissaEsquerda)
        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
            
            dobradissa.dobrarPontaDaPagina(mouseLocation: self.mouseLocation, xConstraint: self.xConstraint, heightConstraint: self.heightConstraint,constantHeight: 0.9,xConstant: 0.25)
            dobradissaEsquerda.dobrarPontaDaPagina(mouseLocation: self.mouseLocation, xConstraint: self.xConstraint1, heightConstraint: self.heightConstraint1,constantHeight: 0.9,xConstant: -0.25)
            
            
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
            if true {
            self.paginas[numeroDaPaginaAtual].texto.proximoTextoNaTelaASerMostrado(speed: 70, controler: self, numeroDoTextoAtual: self.paginas[numeroDaPaginaAtual].texto.numeroDoTextoAtual)
            }
            
        }
            
             
            
        }
        
    
    
    override func keyUp(with event: NSEvent) {
        
    }
    

    @objc func virarPagina(_ Button: PontaDaPaginaAnimada) {
        
        if  Button.ladoEsquerdo {
            if self.numeroDaPaginaAtual > 0 {
                print("Voltandooo")
           self.paginas[numeroDaPaginaAtual].passarPaginaPraTras(controler: self)
            }
            
        }else {
            print(self.paginas[self.numeroDaPaginaAtual].texto.y)
            print(self.paginas[self.numeroDaPaginaAtual].texto.x)
            if self.paginas[self.numeroDaPaginaAtual].texto.y < 326 &&  self.paginas[self.numeroDaPaginaAtual].texto.x > 221  {
                print("Indoooo")
                self.paginas[numeroDaPaginaAtual].passarPaginaPraFrente(controler: self)
            
            }
            
        }
        
    }
    
}
