//
//  PontaDaPaginaAnimada.swift
//  Elysis
//
//  Created by Gilberto Magno on 14/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


enum PontaDaPaginaAnimadaType: Int {
    case esquerda,
    direita
}



class PontaDaPaginaAnimada: NSButton {
    let imagem: NSImage
    let pontaDaPaginaAnimadaType: PontaDaPaginaAnimadaType
    let numeroDeImagens: Int
    var numeroDaImagemAtual: Int
    let ladoEsquerdo: Bool
    
     required init?(coder aDecoder: NSCoder) {
        fatalError("Não foi possível init")
    }

    
    
    
    
    init?(pontaDaPaginaAnimadaType: PontaDaPaginaAnimadaType) {
        self.pontaDaPaginaAnimadaType = pontaDaPaginaAnimadaType
        self.numeroDeImagens = 50
        self.numeroDaImagemAtual = 0
        
        
        
        
        switch pontaDaPaginaAnimadaType {
        case .esquerda:
            self.imagem = NSImage(named: "PontaEsquerda")!
            self.ladoEsquerdo = true
        case .direita:
            self.imagem = NSImage(named: "PontaDireita")!
            self.ladoEsquerdo = false
        }
        
        
        super.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        self.image =  self.imagem
        self.isBordered = false
       // self.bezelStyle = .circular
    }
    
    
    
    
    func dobrarPontaDaPagina(mouseLocation: NSPoint, xConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint,constantHeight: CGFloat, xConstant: CGFloat) {
            
        
        if mouseLocation.y > self.frame.minY && mouseLocation.y < self.frame.maxY && mouseLocation.x > self.frame.minX && mouseLocation.x < self.frame.maxX {
            if self.numeroDaImagemAtual < self.numeroDeImagens {
                //print(self.numeroDaImagemAtual)
                heightConstraint.constant += constantHeight
                xConstraint.constant -= xConstant
                if self.numeroDaImagemAtual > 0 {
                }
                self.numeroDaImagemAtual += 1
            Thread.sleep(forTimeInterval: 0.0001)
            }
        }else {
            
            if self.numeroDaImagemAtual > 0 {
                
                heightConstraint.constant -= constantHeight
                xConstraint.constant += xConstant
            self.numeroDaImagemAtual -= 1
            Thread.sleep(forTimeInterval: 0.0001)
            }
        }
        
        
        
    }
    
}
