//
//  Paginas.swift
//  Elysis
//
//  Created by Gilberto Magno on 16/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


class Pagina: NSObject {
    
    
    

let arrayDeImagens: [NSImage] = [NSImage(named: "PaginaLegal")!]
let imagemAtual: NSImageView = NSImageView(image: NSImage(named: "PaginaLegal")!)
    let texto = TextoNormal(speed: UserDefaults.standard.double(forKey: "textSpeed"))
let pontaDaPaginaDireita = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .direita)
let pontaDaPaginaEsquerda = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .esquerda)
let barraDeTexto = NSTextField()
let barraDeTextoBackgroundImage = NSImageView(image: NSImage(named: "BarraDeTextoBackground")!)
    
    
    func getAnimationDireitaEsquerda() {
       // for a in 0...99 {
//            arrayDeImagens.append(NSImage(named: "PaginaPD\(a+1)")!)
    //    }
        
    }
    
    func getAnimationEsquerdaDireita() {
        
       // for a in 0...99 {
//            arrayDeImagens.append(NSImage(named: "PaginaPD\(100 - a)")!)
      //  }
        
    }
    
    
    func animarPaginaVirandoa(controler: PageViewController, ladoEsquerdo: Bool) {
//        var runCount = 0
//        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
//            self.imagemAtual.image = self.arrayDeImagens[runCount]
//            runCount += 1
//            if runCount >= 100 {
                if !ladoEsquerdo {
                self.passarPaginaPraFrente(controler: controler)

                }else{
                    self.passarPaginaPraTras(controler: controler)

                }
//                self.arrayDeImagens.removeAll()
//                timer.invalidate()
//            }
//
//        }
        
    }
    
func passarPaginaPraFrente(controler: PageViewController) {
    
    AnimarPaginaVirando(ladoEsquerdo: false)
    self.imagemAtual.removeFromSuperview()
    self.barraDeTexto.removeFromSuperview()
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
        controler.view.addSubview(controler.paginas[controler.numeroDaPaginaAtual].barraDeTexto)
        controler.PaginaPrincipal.addSubview(controler.paginas[controler.numeroDaPaginaAtual].imagemAtual)
        for texta in controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal {
            controler.view.addSubview(texta)
        }
        
    }
    
    
}
    
    func passarPaginaPraTras(controler: PageViewController) {
        
        AnimarPaginaVirando(ladoEsquerdo: true)
        self.imagemAtual.removeFromSuperview()
        self.barraDeTexto.removeFromSuperview()
        for texta in self.texto.arrayDeTextoNormal {
            texta.removeFromSuperview()
        }
        controler.numeroDaPaginaAtual -= 1
        controler.PaginaPrincipal.addSubview(controler.paginas[controler.numeroDaPaginaAtual].imagemAtual)
        controler.view.addSubview(controler.paginas[controler.numeroDaPaginaAtual].barraDeTexto)
        for texta in controler.paginas[controler.numeroDaPaginaAtual].texto.arrayDeTextoNormal {
            controler.view.addSubview(texta)
            
        }
    }
    
    func AnimarPaginaVirando(ladoEsquerdo: Bool) {
        
        
        
    }
    
    func organizarConstraints(controler: PageViewController) {
        
        controler.view.addSubview(controler.paginas[controler.numeroDaPaginaAtual].imagemAtual)
        controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.translatesAutoresizingMaskIntoConstraints = false
        controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.bottomAnchor.constraint(equalTo: controler.PaginaPrincipal.bottomAnchor, constant: -90).isActive = true
        controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.heightAnchor.constraint(equalToConstant: 628).isActive = true
        controler.paginas[controler.numeroDaPaginaAtual].imagemAtual.centerXAnchor.constraint(equalTo: controler.PaginaPrincipal.centerXAnchor, constant: 0).isActive = true
        
        
    }
    
    func animarAparicaoDaBarraDeTexto(controler: PageViewController) {
        var runCount = 0
        controler.view.addSubview(self.barraDeTexto)
        self.barraDeTexto.translatesAutoresizingMaskIntoConstraints = false
        self.barraDeTexto.topAnchor.constraint(equalTo:self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].bottomAnchor).isActive = true
        self.barraDeTexto.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.barraDeTexto.leadingAnchor.constraint(equalTo:self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].leadingAnchor).isActive = true
        self.barraDeTexto.trailingAnchor.constraint(equalTo: self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].trailingAnchor).isActive = true
        let attributes : [NSAttributedString.Key : Any] = [NSAttributedString.Key.font : NSFont(name: "Baskerville", size: 23)!, NSAttributedString.Key.foregroundColor : NSColor.black]
        self.barraDeTexto.placeholderAttributedString = NSAttributedString(string: "Enter your Feeling Here...", attributes: attributes)
        self.barraDeTexto.alphaValue = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.barraDeTexto.alphaValue += 0.01
            runCount += 1
            
            if runCount == 100 {
                
            self.texto.textoCarregando = false
                timer.invalidate()
            }
            
        }
        
        
        
    }
    
    
    
}
