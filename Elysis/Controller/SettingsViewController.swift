//
//  SettingsViewController.swift
//  Elysis
//
//  Created by Ronaldo Gomes on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {
    
    //MARK: Views and Controls Initialization
    
    var optionsTitle: NSText = {
        let title = NSText()
        title.string = "Options"
        title.font = NSFont(name: "AppleSystemUIFont", size: 30)
        title.alignment = .center
        title.isEditable = false
        title.backgroundColor = .clear
        return title
    }()
    
    var bgmVolumeLabel: NSText = {
        let label = NSText()
        label.string = "Background Music Volume"
        label.font = NSFont(name: "AppleSystemUIFont", size: 18)
        label.alignment = .center
        label.isEditable = false
        label.backgroundColor = .clear
        return label
    }()
    
    var bgmVolumeSlider: NSSlider = {
        let slider = NSSlider()
        slider.minValue = 0
        slider.maxValue = 1
        // Initial Value
        slider.doubleValue = slider.maxValue
        slider.alignment = .center
        slider.action = #selector(didChangeSlider(_:))
        return slider
    }()
    
    var sfxVolumeLabel: NSText = {
        let label = NSText()
        label.string = "Special Effects Volume"
        label.font = NSFont(name: "AppleSystemUIFont", size: 18)
        label.alignment = .center
        label.isEditable = false
        label.backgroundColor = .clear
        return label
    }()
    
    var sfxVolumeSlider: NSSlider = {
        let slider = NSSlider()
        slider.minValue = 0
        slider.maxValue = 1
        // Initial Value
        slider.doubleValue = slider.maxValue
        slider.alignment = .center
        slider.action = #selector(didChangeSlider(_:))
        return slider
    }()
    
    var textSizeLabel: NSText = {
        let label = NSText()
        label.string = "Text Size"
        label.font = NSFont(name: "AppleSystemUIFont", size: 18)
        label.alignment = .center
        label.isEditable = false
        label.backgroundColor = .clear
        return label
    }()
    
    var textSizeSlider: NSSlider = {
        let slider = NSSlider()
        slider.minValue = 16
        slider.maxValue = 48
        // Initial Value
        slider.doubleValue = (slider.maxValue + slider.minValue) / 2
        slider.alignment = .center
        slider.action = #selector(didChangeSlider(_:))
        return slider
    }()
    
    var textSpeedLabel: NSText = {
        let label = NSText()
        label.string = "Text Speed"
        label.font = NSFont(name: "AppleSystemUIFont", size: 18)
        label.alignment = .center
        label.isEditable = false
        label.backgroundColor = .clear
        return label
    }()
    
    var textSpeedSlider: NSSlider = {
        let slider = NSSlider()
        slider.minValue = 0.1
        slider.maxValue = 1
        // Initial Value
        slider.doubleValue = (slider.maxValue + slider.minValue) / 2
        slider.alignment = .center
        slider.action = #selector(didChangeSlider(_:))
        return slider
    }()

    var doneButton: NSButton = {
        let button = NSButton()
        button.title = "Done"
        button.action = #selector(didTapDoneButton)
        return button
    }()
    
    //MARK: View Controller Methods
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOptionsTitle()
        setup(label: bgmVolumeLabel, relativeTo: optionsTitle, additionalMargin: 50)
        setup(control: bgmVolumeSlider, for: bgmVolumeLabel)
        setup(label: sfxVolumeLabel, relativeTo: bgmVolumeLabel)
        setup(control: sfxVolumeSlider, for: sfxVolumeLabel)
        setup(label: textSizeLabel, relativeTo: sfxVolumeLabel)
        setup(control: textSizeSlider, for: textSizeLabel)
        setup(label: textSpeedLabel, relativeTo: textSizeLabel)
        setup(control: textSpeedSlider, for: textSpeedLabel)
        setup(doneButton: doneButton, relativeTo: textSpeedLabel)
    }
    
    //MARK: Actions
    
    @objc func didTapDoneButton() {
        self.view.window!.contentViewController = ViewController()
    }
    
    @objc func didChangeSlider(_ slider: NSSlider) {
//        print(slider.doubleValue)
    }
    
    //MARK: Setup
    
    func setupOptionsTitle() {
        self.view.addSubview(optionsTitle)
        optionsTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.optionsTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: ((100*self.view.frame.height)/self.view.frame.height)),
            self.optionsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.optionsTitle.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05),
            self.optionsTitle.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2)
        ])
    }
    
    func setup(label: NSText, relativeTo referenceLabel: NSText, additionalMargin: CGFloat = 0) {
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: referenceLabel.bottomAnchor, constant: 30 + additionalMargin),
            label.trailingAnchor.constraint(equalTo: optionsTitle.leadingAnchor, constant: 100),
            label.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05),
            label.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2)
        ])
    }
    
    func setup(control: NSControl, for label: NSText) {
        self.view.addSubview(control)
        control.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            control.topAnchor.constraint(equalTo: label.topAnchor),
            control.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 100),
            control.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05),
            control.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2)
        ])
    }
    
    func setup(doneButton: NSButton, relativeTo label: NSText) {
        self.view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.doneButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            self.doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.doneButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05),
            self.doneButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2)
        ])
    }
}
