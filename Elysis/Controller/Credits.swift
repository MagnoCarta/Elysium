//
//  Credits.swift
//  Elysis
//
//  Created by Gilberto Magno on 25/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa



class Credits: NSViewController {
    
    var textoStyle: [NSTextView] = []
    let stringASerMostrada: String = "Game created by the Team Viajantes de Meghaazord\nKellyane Nogueira\nRodrigo Matos\nGilberto Magno Souza Vieira\nRonaldo Gomes\n"
    var textoAtual = 0
    var arrayDeLinha: [String] = []
    
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.window?.acceptsMouseMovedEvents = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animarTextoDosCreditos()
        
        
        
        Timer.scheduledTimer(withTimeInterval: TimeInterval(Double(self.arrayDeLinha[self.textoAtual].count)*0.08), repeats: true) { timer in
            if self.textoAtual < self.arrayDeLinha.count {
            self.textoRolando()
            
        }else {
            timer.invalidate()
            self.view.window?.contentViewController = ViewController()
        }
        
        }
        }
    
    
    override func keyDown(with event: NSEvent) {
                
        
        
    }
    
    func textoRolando() {
        var posicao = 0

        Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { timer in
               //     print("a \(self.arrayDeLinha[self.textoAtual][posicao])")
            self.textoStyle[self.textoAtual].string += "\(self.arrayDeLinha[self.textoAtual][posicao])"
                posicao += 1
            if posicao == self.arrayDeLinha[self.textoAtual].count {
                self.textoAtual += 1
            timer.invalidate()
        }
        
    }
    }
    
    func animarTextoDosCreditos() {
        let indices = self.stringASerMostrada.indices(of: "\n")
        for a in  self.stringASerMostrada.split(separator: "\n") {
            self.arrayDeLinha.append(String(a))
        }
        
        for a  in 0...indices.count-1 {
            
            self.textoStyle.append(NSTextView(frame: NSRect(x: 0, y: 0, width: 500*self.view.frame.width/1280, height: 0 )))
            self.textoStyle[a].translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(self.textoStyle[a])
            self.textoStyle[a].topAnchor.constraint(equalTo: self.view.topAnchor, constant: CGFloat(150 + a*70)*self.view.frame.height/800).isActive = true
            
            self.textoStyle[a].heightAnchor.constraint(equalToConstant: 60*self.view.frame.height/800).isActive = true
            self.textoStyle[a].centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.textoStyle[a].widthAnchor.constraint(equalToConstant: 1100*self.view.frame.width/1280).isActive = true
            self.textoStyle[a].textColor = .white
            self.textoStyle[a].font = NSFont(name: "Baskerville", size: 50)
            self.textoStyle[a].alignment = .center
            
            
            
                             
            }
                
            
        }
        
        
        
       
    


    
    
    override func viewDidAppear() {
           super.viewDidAppear()
           self.view.window?.makeFirstResponder(self)
           self.view.window?.makeKey()
       
       }
    
    
    
    
}
