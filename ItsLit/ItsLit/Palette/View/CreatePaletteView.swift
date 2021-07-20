//
//  CreatePaletteView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct CreatePaletteView: View {
    @ObservedObject
        var model: CreatePaletteViewModel
    var body: some View {
        VStack{
            HStack{
                Text("Criar Paleta")
                    .font(.title)
                Spacer()
            }
                DragView(model: model)
                VStack{
                    Text("Paleta de cores")
                        .padding()
                        .font(.title2)
                    HStack{
                        if(model.pallete.count > 0){
                            ForEach(0..<model.pallete.count, id: \.self) { row in
                                Circle()
                                    .foregroundColor(Color(model.pallete[row]))
                                }
                        }else{
                            ForEach(0..<4, id: \.self) { row in
                                Circle()
                                    .foregroundColor(Color(red: 12, green: 12, blue: 12, opacity: 0))
                                }
                        }
                    }.padding()
                }.background(Color.gray)
                .cornerRadius(50.0)
                .padding()
            Button(action: {
                
            }) {
                Text("Salvar paleta")
                    .padding(10.0)
            }
        }.padding()
    }
}

struct CreatePaletteView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePaletteView(model: CreatePaletteViewModel())
    }
}
