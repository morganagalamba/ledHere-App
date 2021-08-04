//
//  CreatePaletteView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct CreatePaletteView: View {
    @Binding var showPopover: Bool
    @Binding var pallet: [Color]
    @ObservedObject
        var model: CreatePaletteViewModel
    var body: some View {
        ZStack{
            Color(UIColor.systemGray5)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Text("Criar Paleta através da foto")
                        .font(.title)
                    Spacer()
                    Button(action: {
                        self.showPopover = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                }
                    DragView(model: model)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .padding()
                    VStack{
                        Text("Paleta de cores")
                            .padding()
                            .font(.title2)
                        HStack{
                            if(model.pallete.count > 0){
                                ForEach(0..<model.pallete.count, id: \.self) { row in
                                    Circle()
                                        .foregroundColor(Color(model.pallete[row]))
                                        .frame(width: 50, height: 50)
                                    }
                            }else{
                                ForEach(0..<4, id: \.self) { row in
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color(red: 12, green: 12, blue: 12, opacity: 0))
                                    }
                            }
                        }.padding()
                    }.background(Color(UIColor.systemGray6))
                    .cornerRadius(25.0)
                    .padding()
                Button(action: {
                    for i in 0 ... 3 {
                        pallet[i] = Color(model.pallete[i])
                        self.showPopover = false
                    }
                }) {
                    Text("Salvar paleta")
                        .padding()
                        .frame(width: 150, height: 50)
                        .foregroundColor(.gray)
                        .background(Color("background"))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                        .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                    
                }
            }.padding()
        }
        .cornerRadius(25.0)
    }
}

/*struct CreatePaletteView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePaletteView(showPopover: false, model: CreatePaletteViewModel())
    }
}*/
