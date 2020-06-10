//
//  Database.swift
//  Elysis
//
//  Created by Rodrigo Matos Aguiar on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

class Database {
    
    var saveURL: URL
    
    static let shared = Database()
    
    private init() {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        saveURL = documentURL.appendingPathComponent("save.json")
    }
}
