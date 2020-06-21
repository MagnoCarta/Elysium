//
//  TextoNormal.swift
//  Elysis
//
//  Created by Gilberto Magno on 15/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa

extension StringProtocol {
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index]
    {
        var indices: [Index] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                    
                    indices.append(range.lowerBound)
                    startIndex = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return indices
    }
}

class TextoNormal: NSObject {
    var arrayDeTextoNormal: [NSTextView] = []
    var textoAtual: String = ""
    var numeroDoTextoAtual: Int = 0
    var x = 190
    var y = 685
    var speed: CGFloat
    var textoCarregando: Bool = false
    var x1Aux = 665
    var numeroDeEspacos = 0
    var Nindice: [String.Index] = []
    var numeroDeLinhas = 0
    var textoFormatadoEmArrays:[String] = []
    var horaDaBarraDeTexto: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Não foi Possível iniciar!")
    }
    
    init(speed: CGFloat){
        self.speed = speed
        
    }
    
    func proximoTextoNaTelaASerMostrado(speed: TimeInterval,controler: PageViewController) {
        
        
        
        if self.y - self.numeroDeLinhas*18 < 300 && self.x  > 221 {
            
        }
        
        else {
            if !self.textoCarregando {
                if self.numeroDoTextoAtual == self.arrayDeTextoNormal.count {
                    controler.numeroDoTextoAtual = 0
                    self.receberTextoDaPagina(controler: controler)
                }else {
                
                    self.organizarPosicoesDoTextoEAnimar(controler: controler)
                
                
                }
            }else {
                
                
            }
            
            
            
        }
        
        
        
        
    }
    
    
    func animacaoTextoRolando(numeroDoTextoAtual: Int, speed: TimeInterval) {
        self.textoCarregando = true
        var operac = [BlockOperation]()

        for a in self.textoFormatadoEmArrays[numeroDoTextoAtual] {
            
            let opera = BlockOperation {
                DispatchQueue.main.async {
                    
                    self.arrayDeTextoNormal[numeroDoTextoAtual].string += "\(a)"
                }
                
                Thread.sleep(forTimeInterval: TimeInterval(1)/speed)
            }
            operac.append(opera)
        }
        for i in 1...self.textoFormatadoEmArrays[numeroDoTextoAtual].count-1 {
            operac[i].addDependency(operac[i-1])
            
        }
        
        
        let operaFinal = BlockOperation {
            self.textoCarregando = false
        }
        
        operaFinal.addDependency(operac[self.textoFormatadoEmArrays[numeroDoTextoAtual].count-1])
        let queue = OperationQueue()
        
        for i in 0...self.textoFormatadoEmArrays[numeroDoTextoAtual].count-1 {
            
            queue.addOperation(operac[i])
            
        }
        
        
        
        queue.addOperation(operaFinal)
        
    }
    
    func receberTextoDaPagina(controler: PageViewController) {
        if self.horaDaBarraDeTexto {
            controler.paginas[controler.numeroDaPaginaAtual].animarAparicaoDaBarraDeTexto(controler: controler)
            self.horaDaBarraDeTexto = false
            self.y  -= 70
        }else {
            self.horaDaBarraDeTexto = true
            controler.respostasDoUsuario.append(controler.paginas[controler.numeroDaPaginaAtual].barraDeTexto.string)
        
        controler.historia.getHistory(controler.iteracaoAtual, controler.respostasDoUsuario[controler.iteracaoAtual], completion: {result in
            DispatchQueue.main.async {
            self.organizarArrayDeTextoETextoNormal(texto: result, controler: controler)
            self.organizarPosicoesDoTextoEAnimar(controler: controler)
            
            }
            
        })
        controler.iteracaoAtual += 1
        }
        
    }
    
    
    func organizarArrayDeTextoETextoNormal(texto: String,controler: PageViewController) {
        self.Nindice = texto.indices(of: "\n")
        self.numeroDeEspacos = self.Nindice.count
        
        for a in self.numeroDoTextoAtual...self.numeroDeEspacos-1+self.numeroDoTextoAtual {
            self.arrayDeTextoNormal.append(NSTextView(frame: NSRect(x: 0, y: 0, width: 425, height: 0)))
            self.arrayDeTextoNormal[a].isEditable = false
            self.arrayDeTextoNormal[a].backgroundColor = .clear
            self.arrayDeTextoNormal[a].font = NSFont(name: "Baskerville", size: 18)
            self.arrayDeTextoNormal[a].textColor = .black
            controler.view.addSubview(self.arrayDeTextoNormal[a])
            if a == self.numeroDoTextoAtual {
                self.textoFormatadoEmArrays.append(String(texto[...self.Nindice[a-self.numeroDoTextoAtual]]))
            }else {
                self.textoFormatadoEmArrays.append(String(texto[self.Nindice[a-self.numeroDoTextoAtual-1]...self.Nindice[a-self.numeroDoTextoAtual]]))
                
            }
        }
        
    }
    
    
    func receberTextoDaPaginaAnteriorPorqueNaoAcabouAIteracaoAinda(controler: PageViewController) {
        
        controler.paginas[controler.numeroDaPaginaAtual].texto.textoFormatadoEmArrays = controler.paginas[controler.numeroDaPaginaAtual-1].texto.textoFormatadoEmArrays
        controler.paginas[controler.numeroDaPaginaAtual].texto.numeroDoTextoAtual = controler.paginas[controler.numeroDaPaginaAtual-1].texto.numeroDoTextoAtual 
        for a in 0...controler.paginas[controler.numeroDaPaginaAtual].texto.textoFormatadoEmArrays.count-1 {
            
            self.arrayDeTextoNormal.append(NSTextView(frame: NSRect(x: 0, y: 0, width: 425, height: 0)))
            self.arrayDeTextoNormal[a].isEditable = false
            self.arrayDeTextoNormal[a].backgroundColor = .clear
            self.arrayDeTextoNormal[a].font = NSFont(name: "Baskerville", size: 18)
            self.arrayDeTextoNormal[a].textColor = .black
            controler.view.addSubview(self.arrayDeTextoNormal[a])
            
        }
        
    }
    
    
    func organizarPosicoesDoTextoEAnimar(controler: PageViewController) {
        
        
    
        
        self.y -= self.numeroDeLinhas*(Int(self.arrayDeTextoNormal[self.numeroDoTextoAtual].font!.capHeight)+11)
        
        if self.y < 300 {
            
            self.y = 685
            self.x = self.x1Aux
            
        }
        
        self.arrayDeTextoNormal[self.numeroDoTextoAtual].setFrameOrigin(NSPoint(x: self.x, y: self.y))
        
        
        self.numeroDeLinhas = 1+self.textoFormatadoEmArrays[self.numeroDoTextoAtual].count/52
        self.animacaoTextoRolando(numeroDoTextoAtual: self.numeroDoTextoAtual, speed: 120)
        
        self.numeroDoTextoAtual += 1
        controler.numeroDoTextoAtual += 1
        
    }
    
    
}

/*Fontes Interessantes pra dar uma olhada e ver qual melhor se aplica
 Baskerville,
 "Baskerville Old Face"
 
 
 
 Courier,
 "Courier New"
 
 
 
 
 Didot
 
 
 
 */
