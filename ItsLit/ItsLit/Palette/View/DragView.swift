//
//  DragView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 13/07/21.
//

import SwiftUI
import swift_vibrant

struct DragView: View {
    @State var image = UIImage(named: "image")
    @State private var dragOver = false
    @ObservedObject var model:CreatePaletteViewModel
    init(model:CreatePaletteViewModel){
        self.model = model
    }
    var body: some View {
        ZStack{

            let image = Image(uiImage: image ?? UIImage()).padding()
            RoundedRectangle(cornerRadius: 25.0)
                .overlay(image)
                .foregroundColor(Color("background"))

            VStack{
                Image(systemName: "photo")
                    .font(.title)
                Text("Solte aqui uma imagem")
                    .font(Font.custom("Poppins-Regular", size: 18))
                   
            } .foregroundColor(.gray)
          
                }.onDrop(of: ["public.image"], isTargeted: $dragOver) { providers -> Bool in
                    providers.first?.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                        if let image = image as? UIImage {
                            DispatchQueue.main.async {
                                self.image = image
                                model.getPallete(image: image)
                            }
                        }
                    })
                    return true
                }
        
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView(model:CreatePaletteViewModel())
    }
}
