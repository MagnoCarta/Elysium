//
//  coverAnimation.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 17/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa
import SpriteKit
//import GameplayKit

class CoverAnimation: NSViewController {
    

    
    override func loadView() {
        self.view  = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
