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
    var numeroDeLinhas = 4
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Não foi Possível iniciar!")
    }
    
    init(speed: CGFloat){
        self.speed = speed
    }
    
    func proximoTextoNaTelaASerMostrado(speed: TimeInterval,controler: PageViewController) {
        
        
        
        
        
        
        
        if self.y - self.numeroDeLinhas*18 < 300 && self.x  > 221 {
            
        }else {
            if !self.textoCarregando {
                controler.historia.getHistory(controler.iteracaoAtual, controler.respostasDoUsuario[controler.iteracaoAtual], completion: {result in
                    print(result)
                    if controler.numeroDoTextoAtual == 0 || self.numeroDoTextoAtual == 0 {
                        self.numeroDeEspacos = result.indices(of: "\n").count
                        self.Nindice = result.indices(of: "\n")
                    }
                    if controler.numeroDoTextoAtual < self.numeroDeEspacos && controler.numeroDoTextoAtual > 0 {
                        self.textoAtual = String(result[self.Nindice[controler.numeroDoTextoAtual-1]...self.Nindice[controler.numeroDoTextoAtual]])
                        controler.numeroDoTextoAtual += 1
                        
                    }else  if controler.numeroDoTextoAtual == 0 {
                        self.textoAtual = String(result[...self.Nindice[controler.numeroDoTextoAtual]]
                        )
                        controler.numeroDoTextoAtual += 1
                    }
                    if controler.numeroDoTextoAtual == self.numeroDeEspacos {
                        
                        controler.iteracaoAtual += 1
                        controler.numeroDoTextoAtual = 0
                        
                    }
                    if self.textoAtual == "" {
                        self.textoAtual = "..."
                    }
 
                    
    
                    
                    
                    
                    
                    
                    
                    DispatchQueue.main.async {
                    self.arrayDeTextoNormal.append(NSTextView(frame: NSRect(x: 20, y: 20, width: 425, height: 0)))
                    self.arrayDeTextoNormal[self.numeroDoTextoAtual].isEditable = false
                    self.arrayDeTextoNormal[self.numeroDoTextoAtual].backgroundColor = .clear
                    self.arrayDeTextoNormal[self.numeroDoTextoAtual].font = NSFont(name: "Baskerville", size: 18)
                    self.arrayDeTextoNormal[self.numeroDoTextoAtual].textColor = .black
                    controler.view.addSubview(self.arrayDeTextoNormal[self.numeroDoTextoAtual])
                    
                    
                    self.y -=  (self.numeroDeLinhas * 21)
                    if self.y < 180 {
                        self.y = 655
                        self.x = self.x1Aux
                    }
                    
                    if self.numeroDoTextoAtual > 0 || !(self.y == 655 && self.x == 220) {
                        self.numeroDeLinhas  = 1 + self.textoAtual.count/53
                        print(self.numeroDeLinhas)
                        print(self.y)
                    }
                    self.arrayDeTextoNormal[self.numeroDoTextoAtual].setFrameOrigin(NSPoint(x: self.x, y: self.y))
                      
                    self.animacaoTextoRolando(numeroDoTextoAtual: self.numeroDoTextoAtual, speed: speed)
                    self.numeroDoTextoAtual += 1
                  
                    }
                } )
            }else {
                
                
            }
            
            
            
        }
        
        
        
        
    }
    
    
    
    func animacaoTextoRolando(numeroDoTextoAtual: Int, speed: TimeInterval) {
        self.textoCarregando = true
        var operac = [BlockOperation]()

        for a in self.textoAtual {
            
            let opera = BlockOperation {
                DispatchQueue.main.async {
                    
                    self.arrayDeTextoNormal[numeroDoTextoAtual].string += "\(a)"
                }
                
                Thread.sleep(forTimeInterval: TimeInterval(1)/speed)
            }
            operac.append(opera)
        }
        for i in 1...textoAtual.count-1 {
            operac[i].addDependency(operac[i-1])
            
        }
        
        
        let operaFinal = BlockOperation {
            self.textoCarregando = false
        }
        
        operaFinal.addDependency(operac[textoAtual.count-1])
        let queue = OperationQueue()
        
        for i in 0...textoAtual.count-1 {
            
            queue.addOperation(operac[i])
            
        }
        
        
        
        queue.addOperation(operaFinal)
        
    }
    
    func receberTextoDaPagina(controler: PageViewController) {
        
    }
    
    
    
    
    
    
}

/*Fontes Interessantes pra dar uma olhada e ver qual melhor se aplica
 Baskerville,
 "Baskerville Old Face"
 
 
 
 Courier,
 "Courier New"
 
 
 
 
 Didot
 
 
 
 */
