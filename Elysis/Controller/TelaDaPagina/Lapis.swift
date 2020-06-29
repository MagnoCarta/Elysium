//
//  FeedbackTextual.swift
//  Elysis
//
//  Created by Gilberto Magno on 27/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


class Lapis: NSImageView {
    var heightConstraint: NSLayoutConstraint  = NSLayoutConstraint()
    var topConstraint: NSLayoutConstraint  = NSLayoutConstraint()
    var leadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var trailingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("can't be initialized")
    }
    
    init() {
        
        super.init(frame: NSRect(x: 0, y: 0, width: 35, height: 60))
        self.image = NSImage(named: "LapisTransparente")
        
        
        
    }
    
    
    
    func arrumarConstraint(controler: PageViewController) {
        if  controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDoTextoAtual > 0 {
            if  self.heightConstraint.isActive {
            self.removeFromSuperview()
            self.heightConstraint.isActive = false
            self.topConstraint.isActive = false
            self.leadingConstraint.isActive = false
            self.trailingConstraint.isActive = false
            }
            controler.view.addSubview(self)
            self.alphaValue = 0
            self.translatesAutoresizingMaskIntoConstraints = false
            self.imageScaling = .scaleProportionallyDown
            self.heightConstraint = self.heightAnchor.constraint(equalToConstant: 35*controler.numeroMagicoH)
            self.heightConstraint.isActive  = true
            self.leadingConstraint = self.leadingAnchor.constraint(equalTo: controler.ultimoElementoDaView.leadingAnchor, constant:  0)
            self.leadingConstraint.isActive = true
            self.topConstraint = self.topAnchor.constraint(equalTo: controler.ultimoElementoDaView.bottomAnchor)
            self.topConstraint.isActive = true
            self.trailingConstraint = self.trailingAnchor.constraint(equalTo: controler.ultimoElementoDaView.leadingAnchor, constant: 30*controler.numeroMagicoW)
            self.trailingConstraint.isActive = true
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                
                
                if !controler.paginas[controler.numeroDaPaginaAtual].texto.textoCarregando {
                    self.alphaValue = 1
                    timer.invalidate()
                }
            }
            
            
            
        }else {
//            
//            controler.view.addSubview(self)
//            self.translatesAutoresizingMaskIntoConstraints = false
//            self.imageScaling = .scaleProportionallyDown
//            self.heightConstraint = self.heightAnchor.constraint(equalToConstant: 35)
//            self.heightConstraint.isActive  = true
//            self.leadingConstraint = self.leadingAnchor.constraint(equalTo: controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.leadingAnchor)
//            self.leadingConstraint.isActive = true
//            self.topConstraint = self.topAnchor.constraint(equalTo: controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.topAnchor,constant: 30)
//            self.topConstraint.isActive = true
//            self.trailingConstraint = self.trailingAnchor.constraint(equalTo: controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.trailingAnchor,constant: 30)
//                self.trailingConstraint.isActive = true
            
        }
        
    }
    
    func mouseSobreBotao(mouseLocation: NSPoint) {
        
        if mouseLocation.y > self.frame.minY && mouseLocation.y < self.frame.maxY && mouseLocation.x > self.frame.minX && mouseLocation.x < self.frame.maxX {
            
            self.image = NSImage(named: "LapisColorido")
            
        }else{
            
            self.image = NSImage(named: "LapisTransparente")
            
            
        }
        
    }
    
    


}



