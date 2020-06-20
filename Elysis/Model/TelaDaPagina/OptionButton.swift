//
//  OptionButton.swift
//  Elysis
//
//  Created by Gilberto Magno on 18/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa



class OptionButton: NSButton {
    let imagem = NSImage(named: "LacoOption")
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("fail to init")
    }
    
    
    init() {
        
        
        
        super.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        self.image = imagem
    }
    
    
}
