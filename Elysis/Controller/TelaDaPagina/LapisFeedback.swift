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
        
       // xConstraint.constant += CGFloat(controler.incrementadorDeImagemLapisAnimation)
        //self.rotate(byDegrees: CGFloat(controler.incrementadorDeImagemLapisAnimation)/3)
       // print(self.frame.minY)
        var runCount = 0
        var runCount1 = 0
        
            
            
            Timer.scheduledTimer(withTimeInterval: 0.009, repeats: true) { timer in
                if controler.paginas[controler.numeroDaPaginaAtual].texto.y == 665 {
                bottomConstraint.constant -= 1
                runCount += 1
                    controler.isWriting = true
                if bottomConstraint.constant <= -580 {
                    controler.isWriting = false
                    timer.invalidate()

                }
                
            }
            
        }
        
        if CGFloat(self.frame.minY) > CGFloat(controler.paginas[controler.numeroDaPaginaAtual].texto.y - 105) {
         
            Timer.scheduledTimer(withTimeInterval: 0.009, repeats: true) { timer in
                bottomConstraint.constant += 1
                runCount1 += 1
                controler.isWriting = true
                if runCount1 == controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDeLinhas*Int(controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal[controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDoTextoAtual-1].font!.capHeight+11) {
                    controler.isWriting = false
                    timer.invalidate()

                }
                
            }
            
        }
                        //else if self.frame.minY < controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal[controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDoTextoAtual-1].frame.minY - 105{
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
        
   
