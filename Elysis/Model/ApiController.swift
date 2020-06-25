//
//  ApiController.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

class ApiController{
    
    func Submit(_ text: String, completion: @escaping (ApiResponse) -> Void) {

        let urlApi = URL(string: "https://sentim-api.herokuapp.com/api/v1/")
        guard let requestUrl = urlApi else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        //Definindo o header da solicitacao URL
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //Parametros que serão enviados no corpo da solicitação HTTP


        let body: [String: Any] = ["text": "\(text)"]
        
        //Cria o json que sera enviado
        let jsonData = try? JSONSerialization.data(withJSONObject: body)

        //Body da solicitacao http
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            //print("Error", error ?? "nil")
            //print("Response", response ?? "nil")
           
            if let data = data {
                do {
                    let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                    completion(apiResponse)
                } catch{
                    print(NSDebugDescriptionErrorKey)
                }
                 
            }

        }
        
        task.resume()
        
    }
    
    func SubmitSave(_ playerAnswer: String, completion: @escaping (Interaction?) -> Void) {
        Submit(playerAnswer) { apiResponse in
            guard let polarity = Polarity(rawValue: apiResponse.result.type) else {
                completion(nil)
                return
            }
            let interaction = Interaction(playerAnswer: playerAnswer, answerPolarity: polarity)
            let gameState = GameState()
            var interactions = gameState.load()
            interactions.append(interaction)
            gameState.save(interactions)
            completion(interaction)
        }
    }
}

