//
//  FlipController.swift
//  Elysis
//
//  Created by Gilberto Magno on 16/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa


class FlipController: NSCollectionView {
    
    
    
    
    override func viewDidUnhide() {
        super.viewDidUnhide()
        
        
        self.backgroundColors = .init(repeating: .red, count: 3)
        
        
        
    }
    

}
