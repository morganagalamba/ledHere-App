//
//  CreatePaletteViewModel.swift
//  ItsLit
//
//  Created by Lucas Silva on 20/07/21.
// reference: https://medium.com/mackmobile/como-fazer-um-post-em-swift-4-2-8732ff61ceeb

import Foundation
import swift_vibrant

class CreatePaletteViewModel: ObservableObject {
    @Published var pallete:[UIColor] = []
   
    func getPallete(image:UIImage){
        // Calling from a background thread
        Vibrant.from(image ?? UIImage()).getPalette({ palette in
            self.pallete = []
            self.pallete.append(palette.Muted?.uiColor ?? UIColor())
            self.pallete.append(palette.LightMuted?.uiColor ?? UIColor())
            self.pallete.append(palette.LightVibrant?.uiColor ?? UIColor())
            self.pallete.append(palette.Vibrant?.uiColor ?? UIColor())
            
        })
        send(effect:324,colors: [[0,0,255], [0,0,0],[123,456,789],[321,654,987]])
    }
    func send(effect:Int, colors:[[Float]]){
        //Coloque a URL da sua API aqui
        let url = "http://192.168.0.101/ColorsSetup:[[0,0,255],[255,0,0],[255,0,0],[0,0,255]]"
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
