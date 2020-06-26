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

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}


class TextoNormal: NSObject {
    var arrayDeTextoNormal: [NSTextView] = []
    var textoAtual: String = ""
    var numeroDoTextoAtual: Int = 0
    var x = 190
    var y = 665
    var speed: TimeInterval
    var textoCarregando: Bool = false
    var x1Aux = 665
    var numeroDeEspacos = 0
    var Nindice: [String.Index] = []
    var numeroDeLinhas = 0
    var textoFormatadoEmArrays:[String] = []
    var horaDaBarraDeTexto: Bool = false
    var auxi = 0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Não foi Possível iniciar!")
    }
    
    init(speed: TimeInterval){
        self.speed = speed
        
    }
    
    func proximoTextoNaTelaASerMostrado(speed: TimeInterval,controler: PageViewController) {
        
        
        if self.numeroDoTextoAtual > 0 {
            auxi =  self.numeroDeLinhas*(Int(self.arrayDeTextoNormal[self.numeroDoTextoAtual-1].font!.capHeight)+11)
        }
        if self.y - auxi < 300 && self.x  > 221 || (controler.iteracaoAtual == 5 && controler.numeroDoTextoAtual == 5) {
            print("aa")
            var auxis = controler.dobradissa!.frame.origin
            auxis.y += 1
            auxis.x += 1
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                controler.dobradissa!.dobrarPontaDaPagina(mouseLocation: auxis, xConstraint: controler.xConstraint, heightConstraint: controler.heightConstraint,constantHeight: 0.9,xConstant: 0.25)
                if controler.dobradissa!.numeroDaImagemAtual >= 20 {
                    timer.invalidate()
                }
            }
            
            
            if (controler.iteracaoAtual == 5 && controler.numeroDoTextoAtual == 5) {
                if !self.textoCarregando {
                    let simboloFinal = NSImageView(image: NSImage(named: "SimboloFinal")!)
                    controler.view.addSubview(simboloFinal)
                    simboloFinal.translatesAutoresizingMaskIntoConstraints = false
                    simboloFinal.topAnchor.constraint(equalTo: self.arrayDeTextoNormal[self.numeroDoTextoAtual-1].bottomAnchor,constant: 30).isActive = true
                    simboloFinal.imageScaling = .scaleProportionallyDown
                    simboloFinal.heightAnchor.constraint(equalToConstant: 100).isActive = true
                    simboloFinal.centerXAnchor.constraint(equalTo: self.arrayDeTextoNormal[self.numeroDoTextoAtual-1].centerXAnchor, constant:  -20).isActive = true
                    simboloFinal.alphaValue = 0
                    
                    Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                        simboloFinal.alphaValue += 0.01
                        if simboloFinal.alphaValue >= 1 {
                        self.organizarPosicoesDoTextoEAnimar(controler: controler)
                            timer.invalidate()
                        }
                    }
                    
                }
            } else if (controler.iteracaoAtual == 5 && controler.numeroDoTextoAtual == 6) {
                
                controler.view.window?.contentViewController = Credits()
                
            }
            
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
        
        
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 1/speed, repeats: true) { timer in
        
            self.arrayDeTextoNormal[numeroDoTextoAtual].string += "\(self.textoFormatadoEmArrays[numeroDoTextoAtual][runCount...runCount])"
            runCount += 1
            if runCount >= self.textoFormatadoEmArrays[numeroDoTextoAtual].count {
                self.textoCarregando = false
                timer.invalidate()
                
            }
        }

        
    }
    
    func receberTextoDaPagina(controler: PageViewController) {
        self.textoCarregando = true
        if self.horaDaBarraDeTexto {
            controler.paginas[controler.numeroDaPaginaAtual].animarAparicaoDaBarraDeTexto(controler: controler)
            self.horaDaBarraDeTexto = false
            self.y  -= 120
        }else {
            self.horaDaBarraDeTexto = true
            if !controler.isLoading {
            //controler.respostasDoUsuario.append(controler.paginas[controler.numeroDaPaginaAtual].barraDeTexto.string)
            }
            
            if controler.iteracaoAtual == controler.respostasDoUsuario.count {
                controler.isLoading = false
            }
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
            self.arrayDeTextoNormal[a].font = NSFont(name: "Baskerville", size: CGFloat(UserDefaults.standard.double(forKey: "textSize")))
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
            self.arrayDeTextoNormal[a].font = NSFont(name: "Baskerville", size: CGFloat(UserDefaults.standard.double(forKey: "textSize")))
            self.arrayDeTextoNormal[a].textColor = .black
            controler.view.addSubview(self.arrayDeTextoNormal[a])
            
        }
        
    }
    
    
    func organizarPosicoesDoTextoEAnimar(controler: PageViewController) {
        
        
    
        
        self.y -= self.numeroDeLinhas*(Int(self.arrayDeTextoNormal[self.numeroDoTextoAtual].font!.capHeight)+11)
        
        if self.y < 280 {
            
            self.y = 665
            self.x = self.x1Aux
            
        }
        
        self.arrayDeTextoNormal[self.numeroDoTextoAtual].setFrameOrigin(NSPoint(x: self.x, y: self.y))
        
        
        self.numeroDeLinhas = 1+self.textoFormatadoEmArrays[self.numeroDoTextoAtual].count/(52*18/Int(self.arrayDeTextoNormal[self.numeroDoTextoAtual].font!.pointSize))
        self.animacaoTextoRolando(numeroDoTextoAtual: self.numeroDoTextoAtual, speed: self.speed)
        
        self.numeroDoTextoAtual += 1
        controler.numeroDoTextoAtual += 1
        self.textoCarregando = false
        
    }
    
    
}

/*Fontes Interessantes pra dar uma olhada e ver qual melhor se aplica
 Baskerville,
 "Baskerville Old Face"
 
 
 
 Courier,
 "Courier New"
 
 
 
 
 Didot
 
 
 
 */
