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
let barraDeTexto = NSTextView(frame: NSRect(x: 0, y: 0, width: 425, height: 100))
let barraDeTextoBackgroundImage = NSImageView(image: NSImage(named: "BarraDeTextoBackground")!)
    
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
            controler.paginas[controler.numeroDaPaginaAtual].texto.horaDaBarraDeTexto = true
            
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
    
    func animarAparicaoDaBarraDeTexto(controler: PageViewController) {
        self.barraDeTextoBackgroundImage.alphaValue = 0
        self.imagemAtual.addSubview(self.barraDeTextoBackgroundImage)
        self.barraDeTextoBackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        self.barraDeTextoBackgroundImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.barraDeTextoBackgroundImage.topAnchor.constraint(equalTo: self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].bottomAnchor,constant: 0).isActive = true
        self.barraDeTextoBackgroundImage.centerXAnchor.constraint(equalTo: self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].centerXAnchor).isActive = true
        self.barraDeTextoBackgroundImage.imageScaling = .scaleProportionallyDown
        self.imagemAtual.addSubview(self.barraDeTexto)
        self.barraDeTexto.translatesAutoresizingMaskIntoConstraints = false
        self.barraDeTexto.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.barraDeTexto.topAnchor.constraint(equalTo: self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].bottomAnchor,constant: 0).isActive = true
        self.barraDeTexto.centerXAnchor.constraint(equalTo: self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].centerXAnchor).isActive = true
        self.barraDeTexto.string = "I am really Happy"
        
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.barraDeTextoBackgroundImage.alphaValue += 0.005
            
            if self.barraDeTextoBackgroundImage.alphaValue == 1 {
                timer.invalidate()
            }
            
        }
    }
    
    
    
}
