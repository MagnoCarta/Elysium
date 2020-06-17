//
//  PaginaDireita.swift
//  Elysis
//
//  Created by Gilberto Magno on 15/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


// a frente dela é Direita, a Trás é Esquerda!?

class PaginaDireita: NSObject {
    let arrayDeImagens: [NSImage] = [NSImage(named: "PaginaDireita")!]
    let imagemAtual: NSImageView = NSImageView(image: NSImage(named: "PaginaDireita")!)
    let texto = TextoNormal(speed: 10)
    let pontaDaPaginaDireita = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .direita)
    
    func passarPaginaPraFrente(controler: PageViewController) {
        
        
        
        
    }
    
    
    
    
    
    
    
}
