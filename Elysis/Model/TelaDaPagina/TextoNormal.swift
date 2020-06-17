//
//  TextoNormal.swift
//  Elysis
//
//  Created by Gilberto Magno on 15/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa



class TextoNormal: NSObject {
    var arrayDeTextoNormal: [NSTextView] = []
    let arrayDeStrings: [String] = ["Era uma vez uma pequena garoitinha que Amava Andar pelo Castelo", "Ela era uma Jovem e Forte Princesa de apena 8 Anos!", "Seu Nome era Otama , e ela Sonhava em Desbravar o mar", "Entretanto ela não poderia realizar seu sonho pois ela estava Fadada a ser a Futura Rainha de Wanateru, o Reino das Flechas", "Um País cercado pela terra Árida , Montanhas gélidas e Florestas Densas, Que impediam a chegada ao mar", "E Sua Responsabilidade era de Cuidar do Reino, caso ela fosse em busca de seu sonho, Golpes e Misérias Ocorreriam em seu Reino", "As últimas palavras de Sua mãe entretanto foram...", "- Nada Impede um Sonho!","Agora que chegamos na segunda página, poderei explicar para ti como a virada de página funciona meu nobre amigo"]
    var numeroDoTextoAtual: Int = 0
    var x = 200
    var y = 655
    var speed: CGFloat
    var textoCarregando: Bool = false
    var x1Aux = 685
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Não foi Possível iniciar!")
    }
    
    init(speed: CGFloat){
        self.speed = speed
    }
    
    func proximoTextoNaTelaASerMostrado(speed: TimeInterval,controler: PageViewController,numeroDoTextoAtual: Int) {
        
        var numeroDeLinhas = 1
        if numeroDoTextoAtual > 0 {
         numeroDeLinhas  += arrayDeStrings[numeroDoTextoAtual-1].count/31
        print(numeroDeLinhas)
        }
        if self.y - numeroDeLinhas*50 < 300 && self.x  > 201 {
            
        }else {
        if !self.textoCarregando {
        self.arrayDeTextoNormal.append(NSTextView(frame: NSRect(x: 20, y: 20, width: 385, height: 35)))
            self.arrayDeTextoNormal[numeroDoTextoAtual].isEditable = false
            self.arrayDeTextoNormal[numeroDoTextoAtual].backgroundColor = .clear
            self.arrayDeTextoNormal[numeroDoTextoAtual].font = NSFont(name: "Heiti TC", size: 20)
        self.arrayDeTextoNormal[numeroDoTextoAtual].textColor = .red
        controler.view.addSubview(arrayDeTextoNormal[numeroDoTextoAtual])
        
        
        self.y -=  (numeroDeLinhas * Int(arrayDeTextoNormal[numeroDoTextoAtual].frame.height))
            if self.y < 180 {
                self.y = 605
                self.x = self.x1Aux
            }
        
        self.arrayDeTextoNormal[numeroDoTextoAtual].setFrameOrigin(NSPoint(x: self.x, y: self.y))
        animacaoTextoRolando(numeroDoTextoAtual: numeroDoTextoAtual, speed: speed)
        self.numeroDoTextoAtual += 1
        }else {
            
            
        }
        
        
        
        }
        
        
        
        
    }
    
    
    
    func animacaoTextoRolando(numeroDoTextoAtual: Int, speed: TimeInterval) {
        self.textoCarregando = true
         var operac = [BlockOperation]()
        for a in self.arrayDeStrings[numeroDoTextoAtual] {
            
            let opera = BlockOperation {
            DispatchQueue.main.async {
                
                self.arrayDeTextoNormal[numeroDoTextoAtual].string += "\(a)"
            }

                Thread.sleep(forTimeInterval: TimeInterval(1)/speed)
            }
            operac.append(opera)
        }
            for i in 1...arrayDeStrings[numeroDoTextoAtual].count-1 {
                operac[i].addDependency(operac[i-1])
                
            }
        
        
            let operaFinal = BlockOperation {
                   self.textoCarregando = false
                   }
                   
                   operaFinal.addDependency(operac[arrayDeStrings[numeroDoTextoAtual].count-1])
            let queue = OperationQueue()
            
            for i in 0...arrayDeStrings[numeroDoTextoAtual].count-1 {
                
                queue.addOperation(operac[i])
                
            }
        
        
       
        queue.addOperation(operaFinal)
        
    }

    
    
    
    
    
}
