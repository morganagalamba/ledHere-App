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
    }
    func send(effect:Int, colors:[[Float]]){
        var setup = LightsSetup(Effect: effect,ColorSetup: colors)
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(setup)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            let url = "http://localhost" //Morgana, alterar aqui
            postRequest(url: url, params: json!){
                                (result, err)  in
                                //Aqui você tem seu resultado
                                if let res:Bool = (result?.values.first as? Bool) {
                                    if(res) {
                                        //Aqui res podera assumir dois valores, true ou false
                                        print("sua requisicao foi realizada com sucesso")
                                    } else {
                                        //Aqui voce pode tratar os erros
                                        print("a requisicao nao funcionou")
                                    }
                                }
                            }
        } catch {
            print(error)
        }
    }
    
    func postRequest(url: String, params: String,
                     completion: @escaping ([String: Any]?, Error?) -> Void){
        //URL válida
        guard let URL = URL(string: url) else {
            completion(nil, nil)
            return
        }
            
        //Cria a representacão da requisição
        let request = NSMutableURLRequest(url: URL)

        //Atribui à requisiçāo o método POST
        request.httpMethod = "POST"

        //Codifica o corpo da mensagem em "data" usando utf8
        request.httpBody = params.data(using: String.Encoding.utf8)


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
                //Houve um erro na comunicao com o servidor
                completion(nil, error)
            }
        }


        //Aciona a tarefa
        task.resume()
    }
}
