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
    var respostaApi = ApiController()
    var polarity: String?
    
    func getHistory( _ numberOfInteraction: Int, _ answer: String, completion:  @escaping (String) ->()) {
        
        if numberOfInteraction == 0 {
            completion(getJson("HistoriaInicial"))
            return
        }
        
        let polarityBefore = polarity
        
        getApiResult(answer) {
            
            switch numberOfInteraction {
            case 1:
                completion(self.getJson("Parte1", self.polarity!))
            
            case 2:
                completion(self.getJson(self.polarity!))
            
            case 3:
                if polarityBefore == "positive" || polarityBefore == "negative" {
                    
                    if self.polarity! == "positive" {
                        self.json = self.json![self.polarity!] as? [String : Any]
                        guard let result = self.json!["result"] as? String else {fatalError("ERRO")}
                        completion(result)
                    }
                    else {
                        self.json = self.json!["negativeOrNeutral"] as? [String : Any]

                        guard let result = self.json!["result"] as? String else {fatalError("ERRO")}
                        completion(result)
                    }
                }
                else {
                
                    if self.polarity! == "negative" {
                        self.json = self.json![self.polarity!] as? [String : Any]
                        guard let result = self.json!["result"] as? String else {fatalError("ERRO")}
                        completion(result)
                    }
                    else {
                        self.json = self.json!["positiveOrNeutral"] as? [String : Any]
                        guard let result = self.json!["result"] as? String else {fatalError("ERRO")}
                        completion(result)
                    }
                }
            case 4:

                guard let result = self.json![self.polarity!] as? String else {fatalError("ERRO")}
                completion(result)
                
            default:
                completion("ERRO")
            }
        }
    }
    
    func getApiResult(_ answer: String, completion:  @escaping () ->()) {
        
        respostaApi.SubmitSave(answer){ response in
            self.polarity = response?.answerPolarity.rawValue
            completion()
        }
    }
    
    func getJson( _ jsonName: String, _ jsonKey: String = "result" ) -> String {
        
        let url = Bundle.main.url(forResource: "\(jsonName)", withExtension: "json")!
        let data = try? Data(contentsOf: url)
        self.json = try? (JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any])
        guard let result = self.json!["\(jsonKey)"] as? String else {fatalError("ERRO")}
        return result
    }
}
