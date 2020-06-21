//
//  LapisFeedback.swift
//  Elysis
//
//  Created by Gilberto Magno on 20/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


class LapisFeedback: NSImageView {
    var imagemAtual = 0
    var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var bottomConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var xConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("nao iniciou")
    }
    
    
    init() {
        
        
        
        super.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        self.image = NSImage(named: "Lapis0")
        self.alphaValue = 0.5
    }
    
    func animar(controler: PageViewController) {
        
        self.image = NSImage(named: "Lapis\(controler.imagemAtualLapisAnimation)")
        controler.imagemAtualLapisAnimation += controler.incrementadorDeImagemLapisAnimation
        if controler.imagemAtualLapisAnimation == 3 {
            controler.incrementadorDeImagemLapisAnimation = -1
        }else if controler.imagemAtualLapisAnimation == 0 {
            controler.incrementadorDeImagemLapisAnimation = 1
        }
        
        
    }
    
    
    func arrumarConstraint(controler: PageViewController, xConstraint: NSLayoutConstraint , bottomConstraint: NSLayoutConstraint) {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.animar(controler: controler)
        }
       // xConstraint.constant += CGFloat(controler.incrementadorDeImagemLapisAnimation)
        //self.rotate(byDegrees: CGFloat(controler.incrementadorDeImagemLapisAnimation)/3)
       // print(self.frame.minY)
        var aux = true
        var aux1 = true
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
        if controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal.count > 0 {
            var runCount =  0
            
            if aux && aux1 {
                self.alphaValue = 1
            } else {
                self.alphaValue = 0.5
            }
        if self.frame.minY > controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal[controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDoTextoAtual-1].frame.minY - 105 {
         
            Timer.scheduledTimer(withTimeInterval: 0.009, repeats: true) { timer in
                bottomConstraint.constant += 0.5
                runCount += 1
                aux = false
                if runCount == 20 {
                }
                if runCount == controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDeLinhas*Int(controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal[controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDoTextoAtual-1].font!.capHeight+11) {
                    aux = true
                    timer.invalidate()

                }
                
            }
            
        }//else if self.frame.minY < controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal[controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDoTextoAtual-1].frame.minY - 105{
//            Timer.scheduledTimer(withTimeInterval: 0.003, repeats: true) { timer in
//                bottomConstraint.constant -= 0.5
//
//                runCount += 1
//                if runCount == 100 {
//
//                    timer.invalidate()
//
//                }
//            }
//        }
            }
        }
        
    }
    
    
    
}

