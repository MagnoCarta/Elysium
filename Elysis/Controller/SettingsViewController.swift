//
//  SettingsViewController.swift
//  Elysis
//
//  Created by Ronaldo Gomes on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {

    var backButton: NSButton = {
        let backbutton = NSButton()
        backbutton.title = "Back"
        return backbutton
    }()
    
    var optionsTitle: NSText = {
        let options = NSText()
        options.string = "Options"
        options.font = NSFont(name: "AppleSystemUIFont", size: 30)
        options.alignment = .center
        return options
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        backButton.setFrameOrigin(NSPoint(x: self.view.frame.minX + 150, y: self.view.frame.maxY - 150))
        setupButton()
        setupOptionsTitle()
        backButton.action = #selector(didTapBackButton(_:))
        
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }
    
    @objc  func didTapBackButton(_ Button: AnyObject){
        
        //MODEL FULLSCREEN
        
        self.view.window!.contentViewController = ViewController()
    }
    
    func setupButton() {
        self.view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            self.backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -100),
            self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            self.backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -1100)
        ])
    }
    
    func setupOptionsTitle() {
        self.view.addSubview(optionsTitle)
        optionsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.optionsTitle.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            self.optionsTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: ((100*self.view.frame.height)/self.view.frame.height)),
            self.optionsTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 200),
            self.optionsTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100)
        ])
    }
}
