//
//  OptionsViewController.swift
//  Elysis
//
//  Created by Rodrigo Matos Aguiar on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa

class OptionsViewController: NSViewController {
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    
}
