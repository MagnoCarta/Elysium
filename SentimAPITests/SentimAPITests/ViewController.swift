//
//  ViewController.swift
//  SentimAPITests
//
//  Created by Ronaldo Gomes on 27/05/20.
//  Copyright © 2020 Ronaldo Gomes. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    @IBOutlet weak var peoplePhrase: UITextView!
    
    @IBOutlet weak var polaridade: UILabel!
    
    @IBOutlet weak var sentimento: UILabel!
    
    var sentim: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func analisarSentimento(_ sender: UIButton) {
        api(frase: peoplePhrase.text)
    }
    

    func api(frase:String){
        //Preparando a url
        let url  = URL(string:"https://sentim-api.herokuapp.com/api/v1/")
        guard let requestUrl = url else { fatalError() }

        //Preparando o objeto da solicitacao URL
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

        //Definindo o header da solicitacao URL
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        //Parametros que serão enviados no corpo da solicitação HTTP
        let json: [String: Any] = ["text": "\(frase)"]
        //Cria o json que sera enviado
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        //Body da solicitacao http
        request.httpBody = jsonData

        //Executa a solicitação HTTP
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            //Checa se houve erro
            if let error = error {
                print("Houve um erro em \(error)")
                return
            }

            // Converter dados de resposta HTTP em uma string
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                    print(json!)
                    let resultado = json!["result"]! as? Dictionary<String, Any>
                    print(resultado!["type"]!)
                    print(type(of:resultado!["type"]!))
                    
                    self.sentim = resultado!["type"]! as? String
                    let polarity = resultado!["polarity"]! as! Double
                    
                } catch {
                    print("Something went wrong")
                }
            }
        }
        task.resume()
        self.sentimento.text = sentim
    }
}
