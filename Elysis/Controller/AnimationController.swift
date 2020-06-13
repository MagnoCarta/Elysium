//
//  AnimationController.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 12/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//


import Cocoa

extension NSView {
    
    open override var acceptsFirstResponder: Bool {
        get { return true }
    }
    
}

class AnimationController: NSViewController {
    var transformLayer: CALayer!

    override func loadView() {
        self.view  = NSView(frame: NSRect(x: NSScreen.main!.frame.minX, y: NSScreen.main!.frame.minY, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true //Indica se a exibição usa um layer como armazenamento de suporte
        transformLayer = CALayer()
        transformLayer.frame = view.bounds.insetBy(dx: 50, dy: 50)
        transformLayer.backgroundColor = NSColor.red.cgColor
        view.layer?.addSublayer(transformLayer)
    }
    
    override func viewDidAppear() {
        self.view.window?.makeFirstResponder(self)// agora ela vai responder à sua view controller
        self.view.window?.makeKey() // aceita keyboard/teclado
    }
    
    override func keyDown(with event: NSEvent) {
        print(event.keyCode)
        if event.keyCode == 123 {
            print("esquerda")
            setAngle(degrees: 1)
        } else if event.keyCode == 124 {
            print("direita")
            setAngle(degrees: -1)
        }
    }
    
    func setAngle(degrees: CGFloat){
        let radians = CGFloat(Double.pi) * degrees / 180.0
        var transform = CATransform3DIdentity
        transform.m34 = 1 / -250
        transform = CATransform3DRotate(transform, radians, 0, 1, 0)
        transformLayer.transform = transform
    }
    
}

    // ______________________ Tentativas __________________
    
//    override var representedObject: Any?{
//        didSet {
//
//        }
//    }
    
    
    //    var img : NSImageView = NSImageView()
    //    var images : [NSImage?] = []
    //
    //     func addInArray(){
    //        for i in 1...10{
    //            let imageName: String = "\(i)"
    //            img.image = NSImage(named: imageName)
    //            images.append(img.image)
    //        }
    //    }
        
    //    func animationImages(){
    //               self.img.layer?.convertTime(CACurrentMediaTime(), from: nil)
    //   }
    
    //    var layer = [CALayer].self
//    var animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"]
//
//    var images = [CGImage]
//
//
    //[[_image animator] setImage:[NSImage imageNamed:@"image.png"]]
    
    
//    @IBAction func paraAnimacao(sender: AnyObject) {
//        var layer = imageView.layer.presentationLayer() as! CALayer
//        var frame = layer.frame
//        print(frame)
//        imageView.layer.removeAllAnimations()
//        imageView.frame = frame
//    }

       // super.viewDidLoad()
//        addInArray()
//        img.setFrameOrigin(NSPoint(x: 300, y: 300))
//        img.setFrameSize(NSSize(width: 300, height: 300))
//        img.imageScaling = .scaleAxesIndependently
//        self.view.addSubview(img)
