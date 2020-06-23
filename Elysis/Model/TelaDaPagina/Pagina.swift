//
//  Paginas.swift
//  Elysis
//
//  Created by Gilberto Magno on 16/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


class Pagina: NSObject {
    
    
    
    var arrayDeImagens: [NSImage] = []
let imagemAtual: NSImageView = NSImageView(image: NSImage(named: "PaginaP")!)
let texto = TextoNormal(speed: 10)
let pontaDaPaginaDireita = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .direita)
let pontaDaPaginaEsquerda = PontaDaPaginaAnimada(pontaDaPaginaAnimadaType: .esquerda)
let barraDeTexto = NSTextView(frame: NSRect(x: 0, y: 0, width: 425, height: 100))
let barraDeTextoBackgroundImage = NSImageView(image: NSImage(named: "BarraDeTextoBackground")!)
    
    
    func getAnimationDireitaEsquerda() {
        for a in 0...99 {
            arrayDeImagens.append(NSImage(named: "PaginaPD\(a+1)")!)
        }
        
    }
    
    func getAnimationEsquerdaDireita() {
        
        for a in 0...99 {
            arrayDeImagens.append(NSImage(named: "PaginaPD\(100 - a)")!)
        }
        
    }
    
    
    func animarPaginaVirandoa(controler: PageViewController, ladoEsquerdo: Bool) {
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
            self.imagemAtual.image = self.arrayDeImagens[runCount]
            runCount += 1
            Thread.sleep(forTimeInterval: 0.0002)
            if runCount >= 100 {
                if !ladoEsquerdo {
                self.passarPaginaPraFrente(controler: controler)
                    
                }else{
                    self.passarPaginaPraTras(controler: controler)
                    
                }
                self.arrayDeImagens.removeAll()
                timer.invalidate()
            }
            
        }
        
    }
    
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
        self.barraDeTextoBackgroundImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.barraDeTextoBackgroundImage.topAnchor.constraint(equalTo: self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].bottomAnchor,constant: 0).isActive = true
        self.barraDeTextoBackgroundImage.centerXAnchor.constraint(equalTo: self.texto.arrayDeTextoNormal[self.texto.numeroDoTextoAtual-1].centerXAnchor).isActive = true
        self.barraDeTextoBackgroundImage.imageScaling = .scaleProportionallyDown
        controler.view.addSubview(self.barraDeTexto)
        self.barraDeTexto.font = NSFont(name: "Baskerville", size: 18)
        self.barraDeTexto.translatesAutoresizingMaskIntoConstraints = false
        self.barraDeTexto.string = "I am really Happy"
        self.barraDeTexto.alphaValue = 0
        self.barraDeTexto.backgroundColor = .clear
        
        
//        self.barraDeTexto.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        self.barraDeTexto.bottomAnchor.constraint(equalTo: self.imagemAtual.topAnchor,constant: 0).isActive = true
//        self.barraDeTexto.centerXAnchor.constraint(equalTo: controler.view.centerXAnchor).isActive = true
        
        
        
        
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if self.barraDeTextoBackgroundImage.alphaValue == 0 {
                self.barraDeTexto.setFrameOrigin(NSPoint(x: (self.barraDeTextoBackgroundImage.frame.origin.x
                    ) - 10, y: self.barraDeTextoBackgroundImage.frame.minY + 65))
            }
            self.barraDeTextoBackgroundImage.alphaValue += 0.005
            self.barraDeTexto.alphaValue += 0.005
            
            if self.barraDeTextoBackgroundImage.alphaValue > 1 {
                
                
                self.texto.textoCarregando = false
                timer.invalidate()
            }
            
        }
        
    }
    
    
    
}
