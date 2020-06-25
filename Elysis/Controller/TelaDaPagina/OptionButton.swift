//
//  OptionButton.swift
//  Elysis
//
//  Created by Gilberto Magno on 18/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa



class OptionButton: NSImageView {
    let imagem = NSImage(named: "LacoOption")
    var xConstraint = NSLayoutConstraint()
    var topConstraint = NSLayoutConstraint()
    var heightConstraint = NSLayoutConstraint()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("fail to init")
    }
    
    
    init() {
        
        
        
        super.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        self.image = imagem
    }
    
    
    
    func mouseSobreBotao(mouseLocation: NSPoint) {
        
        if mouseLocation.y > self.frame.minY && mouseLocation.y < self.frame.maxY && mouseLocation.x > self.frame.minX && mouseLocation.x < self.frame.maxX {
            
            self.image = NSImage(named: "BotaoComMouseEmCima")
            
        }else{
            
            self.image = NSImage(named: "LacoOption")
        
            
        }
        
    }
    
    
}
