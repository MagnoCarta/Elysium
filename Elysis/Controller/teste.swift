//
//  teste.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 12/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation
import Cocoa

class CALayer: NSObject{
    var img : NSImageView = NSImageView()
    var images : [NSImage?] = []
    
    //init(_ img : NSImageView, _ images : [NSImage?])
    
     func addInArray(){
        for i in 1...10{
            let imageName: String = "\(i)"
            self.img.image = NSImage(named: imageName)
            self.images.append(img.image)
        }
    }
    
    //var pausedTime =
  
}
