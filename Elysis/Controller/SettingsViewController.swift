//
//  SettingsViewController.swift
//  Elysis
//
//  Created by Ronaldo Gomes on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa

enum SliderValue {
    case max
    case min
}

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
        slider.doubleValue = UserDefaults.standard.double(forKey: "bgmVolume")
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
        slider.doubleValue = UserDefaults.standard.double(forKey: "sfxVolume")
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
        slider.maxValue = 32
        // Initial Value
        slider.doubleValue = Double(UserDefaults.standard.integer(forKey: "textSize"))
        slider.alignment = .center
        slider.numberOfTickMarks = 9
        slider.action = #selector(didChangeIntSlider(_:))
        return slider
    }()
    
    var textSizeMinLabel: NSText = {
        let label = NSText()
        label.string = "A"
        label.font = NSFont(name: "AppleSystemUIFont", size: 16)
        label.isEditable = false
        label.backgroundColor = .clear
        return label
    }()
    
    var textSizeMaxLabel: NSText = {
        let label = NSText()
        label.string = "A"
        label.font = NSFont(name: "AppleSystemUIFont", size: 32)
        label.isEditable = false
        label.backgroundColor = .clear
        return label
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
        slider.minValue = 5
        slider.maxValue = 100
        // Initial Value
        slider.doubleValue = UserDefaults.standard.double(forKey: "textSpeed")
        slider.alignment = .center
        slider.action = #selector(didChangeSlider(_:))
        slider.numberOfTickMarks = 2
        return slider
    }()
    
    var textSpeedMinLabel: NSText = {
        let label = NSText()
        label.string = "Slowest"
        label.font = NSFont(name: "AppleSystemUIFont", size: 16)
        label.isEditable = false
        label.backgroundColor = .clear
        return label
    }()
    
    var textSpeedMaxLabel: NSText = {
        let label = NSText()
        label.string = "Fastest"
        label.font = NSFont(name: "AppleSystemUIFont", size: 16)
        label.isEditable = false
        label.backgroundColor = .clear
        return label
    }()

    var doneButton: NSButton = {
        let button = NSButton()
        button.title = "Done"
        button.action = #selector(didTapDoneButton)
        return button
    }()
    
    var resetButton: NSButton = {
        let button = NSButton()
        button.title = "Reset"
        button.action = #selector(didTapResetButton)
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
        setup(slider: bgmVolumeSlider, for: bgmVolumeLabel)
        setup(label: sfxVolumeLabel, relativeTo: bgmVolumeLabel)
        setup(slider: sfxVolumeSlider, for: sfxVolumeLabel)
        setup(label: textSizeLabel, relativeTo: sfxVolumeLabel)
        setup(slider: textSizeSlider, for: textSizeLabel)
        setup(label: textSizeMinLabel, for: .min, relativeTo: textSizeSlider)
        setup(label: textSizeMaxLabel, for: .max, relativeTo: textSizeSlider, yVariation: -5)
        setup(label: textSpeedLabel, relativeTo: textSizeLabel)
        setup(slider: textSpeedSlider, for: textSpeedLabel)
        setup(label: textSpeedMinLabel, for: .min, relativeTo: textSpeedSlider, widthMultiplier: 4, xVariation: -25)
        setup(label: textSpeedMaxLabel, for: .max, relativeTo: textSpeedSlider, widthMultiplier: 2, heightMultiplier: 0.5, xVariation: -18)
        setup(button: doneButton, relativeTo: textSpeedLabel, trailingConstant: 100)
        setup(button: resetButton, relativeTo: textSpeedLabel, trailingConstant: 300)
    }
    
    //MARK: Actions
    
    @objc func didTapDoneButton() {
        let defaults = UserDefaults.standard
        defaults.set(bgmVolumeSlider.doubleValue, forKey: "bgmVolume")
        defaults.set(sfxVolumeSlider.doubleValue, forKey: "sfxVolume")
        defaults.set(textSizeSlider.doubleValue, forKey: "textSize")
        defaults.set(textSpeedSlider.doubleValue, forKey: "textSpeed")
        self.view.window!.contentViewController = ViewController()
    }
    
    @objc func didTapResetButton() {
        resetValue(bgmVolumeSlider, forKey: "bgmVolume")
        resetValue(sfxVolumeSlider, forKey: "sfxVolume")
        resetValue(textSizeSlider, forKey: "textSize")
        resetValue(textSpeedSlider, forKey: "textSpeed")
    }
    
    @objc func didChangeSlider(_ slider: NSSlider) {
//        print(slider.doubleValue)
    }
    
    @objc func didChangeIntSlider(_ slider: NSSlider) {
//        print(slider.doubleValue)
        slider.doubleValue = round(slider.doubleValue)
    }
    
    //MARK: Other
    
    func resetValue(_ slider: NSSlider, forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        slider.doubleValue = UserDefaults.standard.double(forKey: key)
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
            label.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06),
            label.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2)
        ])
    }
    
    func setup(slider: NSSlider, for label: NSText) {
        self.view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: label.topAnchor, constant: -25),
            slider.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 75),
            slider.heightAnchor.constraint(equalToConstant: view.frame.height * 0.10),
            slider.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2)
        ])
    }
    
    func setup(label: NSText, for value: SliderValue, relativeTo slider: NSSlider, widthMultiplier: CGFloat = 1, heightMultiplier: CGFloat = 1, xVariation: CGFloat = 0, yVariation: CGFloat = 0) {
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        switch value {
        case SliderValue.min:
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: -25 + yVariation),
                label.leadingAnchor.constraint(equalTo: slider.leadingAnchor, constant: -2 + xVariation),
                label.heightAnchor.constraint(equalToConstant: view.frame.height * 0.02 * heightMultiplier),
                label.widthAnchor.constraint(equalToConstant: view.frame.width * 0.015 * widthMultiplier)
            ])
            break
        case SliderValue.max:
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: -25 + yVariation),
                label.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: -23 + xVariation),
                label.heightAnchor.constraint(equalToConstant: view.frame.height * 0.04 * heightMultiplier),
                label.widthAnchor.constraint(equalToConstant: view.frame.width * 0.025 * widthMultiplier)
            ])
            break
        }
    }
    
    func setup(button: NSButton, relativeTo label: NSText, trailingConstant: CGFloat = 0) {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: optionsTitle.leadingAnchor, constant: trailingConstant),
            button.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05),
            button.widthAnchor.constraint(equalToConstant: view.frame.width * 0.1)
        ])
    }
}
