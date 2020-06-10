//
//  ApiController.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

class ApiController{
    
    func Submit(_ text: String){
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
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
//            print("Error", error)
//            print("Response", response)
           
            if let data = data {
                do{
                    let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                    print(apiResponse.type)
                }catch{
                    print(NSDebugDescriptionErrorKey)
                }
                 
            }

        })
        
        task.resume()
        
        
         /*do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]

            let resultado = json!["result"]! as? Dictionary<String, Any>
                print(resultado!["type"]!)
                print(type(of:resultado!["type"]!))
         } catch {
                print("Something went wrong")
        }
        */
    }
    

   // RunLoop.main.run(until: .distantFuture)
}

