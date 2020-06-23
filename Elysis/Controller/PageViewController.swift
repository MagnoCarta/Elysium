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
    
    
    let PaginaPrincipal = NSImageView(image: NSImage(named: "LivroAbertoPrincipalAzulRoxeado")!)
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
    var iteracaoAtual = 0
    let historia = HistoryModel()
    var respostasDoUsuario: [String] = []
    var imagemAtualLapisAnimation: Int = 0
    var incrementadorDeImagemLapisAnimation: Int = 1
    let lapisAnimado: LapisFeedback = LapisFeedback()
    var transparencia: CGFloat = 1
    let optionButton: OptionButton = OptionButton()
    let dobradissa = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .direita)
    let dobradissaEsquerda = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .esquerda)
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = .init(red: 252/255, green: 58/255, blue: 58/255, alpha: 1)
        self.view.window?.acceptsMouseMovedEvents = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dobradissa!.action = #selector(virarPagina(_:))
       
        self.dobradissaEsquerda!.action = #selector(virarPagina(_:))
        
        organizarTela(dobradissa: dobradissa!, dobradissaEsquerda: dobradissaEsquerda!)
        
        var runCount =  CGFloat(0)
        var ai = true
        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
            if ai {
                ai = false
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                    runCount += 0.01
                    
                    if runCount == 0.1 {
                        timer.invalidate()
                        runCount = 0
                        ai = true
                    }
            
                    self.dobradissa!.dobrarPontaDaPagina(mouseLocation: self.mouseLocation, xConstraint: self.xConstraint, heightConstraint: self.heightConstraint,constantHeight: 0.9,xConstant: 0.25)
                    self.dobradissaEsquerda!.dobrarPontaDaPagina(mouseLocation: self.mouseLocation, xConstraint: self.xConstraint1, heightConstraint: self.heightConstraint1,constantHeight: 0.9,xConstant: -0.25)
                    self.optionButton.mouseSobreBotao(mouseLocation: self.mouseLocation)
            
            }
            
            }
         return $0 }
        
        
        self.lapisAnimado.arrumarConstraint(controler: self, xConstraint: self.lapisAnimado.xConstraint, bottomConstraint: self.lapisAnimado.bottomConstraint)
        
        
         
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
            self.paginas[numeroDaPaginaAtual].texto.proximoTextoNaTelaASerMostrado(speed: 620, controler: self)
            }
            
        }
            
             
            
        }
        
    override func mouseDown(with event: NSEvent) {
             self.view.window?.makeFirstResponder(self)
             self.view.window?.makeKey()
        if event.locationInWindow.y > self.paginas[self.numeroDaPaginaAtual].imagemAtual.frame.minY && event.locationInWindow.y < self.paginas[self.numeroDaPaginaAtual].imagemAtual.frame.maxY && event.locationInWindow.x > self.paginas[self.numeroDaPaginaAtual].imagemAtual.frame.minX/2 - 30 && event.locationInWindow.x < self.paginas[self.numeroDaPaginaAtual].imagemAtual.frame.maxX {
        
             self.paginas[numeroDaPaginaAtual].texto.proximoTextoNaTelaASerMostrado(speed: 620, controler: self)
        }
        if event.locationInWindow.y > self.optionButton.frame.minY && event.locationInWindow.y < self.optionButton.frame.maxY && event.locationInWindow.x > self.optionButton.frame.minX && event.locationInWindow.x < self.optionButton.frame.maxX {
            
            self.presentAsSheet(SettingsViewController())
           // self.view.window?.contentViewController = SettingsViewController()
        }
        
    }
     
    
    override func keyUp(with event: NSEvent) {
        
    }
    

    @objc func virarPagina(_ Button: PontaDaPaginaAnimada) {
        
        if  Button.ladoEsquerdo {
            if self.numeroDaPaginaAtual > 0 {
                print("Voltandooo")
                
           self.paginas[numeroDaPaginaAtual].passarPaginaPraTras(controler: self)
                self.reorganizarConstraints(dobradissa: self.dobradissa!, dobradissaEsquerda: self.dobradissaEsquerda!, LapisAnimado: self.lapisAnimado)
            }
            
        }else {
            print(self.paginas[self.numeroDaPaginaAtual].texto.y)
            print(self.paginas[self.numeroDaPaginaAtual].texto.x)
            if self.paginas[self.numeroDaPaginaAtual].texto.y - (self.paginas[self.numeroDaPaginaAtual].texto.numeroDeLinhas*20) < 326 &&  self.paginas[self.numeroDaPaginaAtual].texto.x > 221  {
                print("Indoooo")
                self.paginas[numeroDaPaginaAtual].passarPaginaPraFrente(controler: self)
                
                self.reorganizarConstraints(dobradissa: self.dobradissa!, dobradissaEsquerda: self.dobradissaEsquerda!, LapisAnimado: self.lapisAnimado)
               
            }
            
        }
        
    }
    
    

    

    
}
