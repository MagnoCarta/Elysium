//
//  Paginas.swift
//  Elysis
//
//  Created by Gilberto Magno on 16/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


class Pagina: NSObject {
    
    
    
let arrayDeImagens: [NSImage] = [NSImage(named: "PaginaNormal")!]
let imagemAtual: NSImageView = NSImageView(image: NSImage(named: "PaginaNormal")!)
let texto = TextoNormal(speed: 10)
let pontaDaPaginaDireita = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .direita)
let pontaDaPaginaEsquerda = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .esquerda)
    
    
    
func passarPaginaPraFrente(controler: PageViewController) {
    
    AnimarPaginaVirando(ladoEsquerdo: false)
    self.imagemAtual.removeFromSuperview()
    for texta in self.texto.arrayDeTextoNormal {
        texta.removeFromSuperview()
    }
    controler.numeroDaPaginaAtual += 1
    if controler.numeroDaPaginaAtual == controler.numeroDePaginas {
        controler.paginas.append(Pagina())
        controler.paginas[controler.numeroDaPaginaAtual].organizarConstraints(controler: controler)
        controler.numeroDePaginas += 1
        if self.texto.numeroDoTextoAtual < self.texto.arrayDeTextoNormal.count {
            
            controler.paginas[controler.numeroDaPaginaAtual].texto.receberTextoDaPaginaAnteriorPorqueNaoAcabouAIteracaoAinda(controler: controler)
            
        }
    }else {
        
        controler.PaginaPrincipal.addSubview(controler.paginas[controler.numeroDaPaginaAtual].imagemAtual)
        for texta in controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal {
            controler.view.addSubview(texta)
        }
        
    }
    
    
}
    
    func passarPaginaPraTras(controler: PageViewController) {
        
        AnimarPaginaVirando(ladoEsquerdo: true)
        self.imagemAtual.removeFromSuperview()
        for texta in self.texto.arrayDeTextoNormal {
            texta.removeFromSuperview()
        }
        controler.numeroDaPaginaAtual -= 1
        controler.PaginaPrincipal.addSubview(controler.paginas[controler.numeroDaPaginaAtual].imagemAtual)
        for texta in controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal {
            controler.view.addSubview(texta)
        }
    }
    
    func AnimarPaginaVirando(ladoEsquerdo: Bool) {
        
        
        
    }
    
    func organizarConstraints(controler: PageViewController) {
        
        controler.view.addSubview(controler.paginas[controler.numeroDaPaginaAtual].imagemAtual)
        controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.translatesAutoresizingMaskIntoConstraints = false
        controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.bottomAnchor.constraint(equalTo: controler.PaginaPrincipal.bottomAnchor, constant: -72).isActive = true
        controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.heightAnchor.constraint(equalToConstant: 658).isActive = true
        controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.centerXAnchor.constraint(equalTo: controler.PaginaPrincipal.centerXAnchor, constant: 0).isActive = true
        
        
    }
    
    
}
