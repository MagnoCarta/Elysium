//
//  HistoryModel.swift
//  Elysis
//
//  Created by Ronaldo Gomes on 17/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

class HistoryModel {
    
    var json: [String: Any]?
    
    func getHistory( _ numberOfInteraction: Int, _ answer: String) -> String{
        
        switch numberOfInteraction {
        case 0:
            let url = Bundle.main.url(forResource: "HistoriaInicial", withExtension: "json")!
            let data = try? Data(contentsOf: url)
            json = try? (JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any])
            //print(json!)
            guard let result = json!["inicio"] as? String else {fatalError("ERRO")}
            return result
        case 1:
            let url = Bundle.main.url(forResource: "Parte1", withExtension: "json")!
            let data = try? Data(contentsOf: url)
            json = try? (JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any])
            guard let result = json!["neutral"] as? String else {fatalError("ERRO")}
            return result
        case 2:
            let url = Bundle.main.url(forResource: "Positive", withExtension: "json")!
            let data = try? Data(contentsOf: url)
            json = try? (JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any])
            guard let result = json!["result"] as? String else {fatalError("ERRO")}
            return result
        case 3:
            json = json!["negativeOrNeutral"] as! [String : Any]
            guard let result = json!["result"] as? String else {fatalError("ERRO")}
            return result
        case 4:
            guard let result = json!["neutral"] as? String else {fatalError("ERRO")}
            return result
        default:
            return "ERRO"
        }
    }
}
