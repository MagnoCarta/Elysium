//
//  SettingsViewController.swift
//  Elysis
//
//  Created by Ronaldo Gomes on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {

    var backButton = NSButton(frame: NSRect(x: 50, y: 50, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backButton)
        backButton.setFrameOrigin(NSPoint(x: self.view.frame.minX + 150, y: self.view.frame.maxY - 150))
        backButton.action = #selector(didTapBackButton(_:))
    }
    
    override func loadView() {
       self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }
    
    @objc  func didTapBackButton(_ Button: AnyObject){
        
        //MODEL FULLSCREEN
        
        self.view.window!.contentViewController = ViewController()
    }
}
