//
//  AppDelegate.swift
//  Elysis
//
//  Created by Gilberto Magno on 08/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let window = NSWindow()
        
        window.makeKey()
        
        let randomViewController = PageViewController()
        randomViewController.view.wantsLayer = true
        randomViewController.view.layer?.backgroundColor = .init(red: 1, green: 0.5, blue: 0.2, alpha: 0.7)
        window.contentViewController = randomViewController
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

