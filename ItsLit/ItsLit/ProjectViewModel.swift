//
//  ProjectViewModel.swift
//  ItsLit
//
//  Created by Lucas Silva on 05/08/21.
//

import Foundation
import SwiftUI

class ProjectViewModel: ObservableObject {
    func getURL(colors:[Color])->String{
        var RGBs : [[Int]] = [[],[],[],[]]
        var x = 0
        while x<colors.count {
            RGBs[x].append(Int(Float(colors[x].cgColor!.components![0])*255))
            RGBs[x].append(Int(Float(colors[x].cgColor!.components![1])*255))
            RGBs[x].append(Int(Float(colors[x].cgColor!.components![2])*255))
            x+=1
        }
        let rgbString = "http://192.168.0.101/ColorsSetup:[[\(RGBs[0][0]),\(RGBs[0][1]),\(RGBs[0][2])],[\(RGBs[1][0]),\(RGBs[1][1]),\(RGBs[1][2])],[\(RGBs[2][0]),\(RGBs[2][1]),\(RGBs[2][2])],[\(RGBs[3][0]),\(RGBs[3][1]),\(RGBs[3][2])]]"
        return rgbString
    }
    func send(colors:[Color]){
        //Coloque a URL da sua API aqui
        let url = getURL(colors: colors)
        print(url)
        //Chamando a funcão GET
        getRequest(url: url){
            (resultado, erro)  in
              if(resultado != nil) {
                  //O resultado aqui vem como Opcional
                  print("Sua requisicao foi realizada com sucesso: \n \(resultado)")
              } else {
                  print("A requisicao nao funcionou")
              }

    }
    func getRequest(url: String,
                     completion: @escaping ([String: Any]?, Error?) -> Void){
        //URL válida
        guard let URL = URL(string: url) else {
            completion(nil, nil)
            return
        }
      
      
        //Cria a representacão da requisição
        let request = NSMutableURLRequest(url: URL)

        
        //Atribui à requisiçāo o método GET
        request.httpMethod = "GET"
        
      
        //Cria a tarefa de requisição
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                
                if let data = data {
                    //A resposta chegou
                    let response = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(response as? [String : Any], nil)
                }
                else {
                    //Não houve resposta
                    completion(nil, nil)
                }
            } catch let error as NSError {
                // Houve um erro na comunicao com o servidor
                completion(nil, error)
            }
        }
        
        
        //Aciona a tarefa
        task.resume()
        
    }

        
        
}
}
