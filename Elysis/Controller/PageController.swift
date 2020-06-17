//
//  PageController.swift
//  Elysis
//
//  Created by Gilberto Magno on 16/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa

class pagina1: NSViewController {
    
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = .init(red: 255, green: 60/255, blue: 60/255, alpha: 0.8)
        self.view.window?.acceptsMouseMovedEvents = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.makeFirstResponder(self)
        self.view.window?.makeKey()
    }
    
    
    
    
    
    
    
}
