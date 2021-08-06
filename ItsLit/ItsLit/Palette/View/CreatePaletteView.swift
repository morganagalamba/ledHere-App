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
            Color("background")
                .ignoresSafeArea()
            VStack{

                
                HStack(alignment: .center){
                    Text("Criar Paleta através da foto")
                        .font(Font.custom("Poppins-Regular", size: 18))
                        .foregroundColor(.gray)
                    
                }
                    DragView(model: model)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("background"),
                                        lineWidth: 2)
                                .shadow(color: Color.gray, radius: 3, x: 5, y: 5)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 15)
                                )
                                .shadow(color: Color.white, radius: 2, x: -2, y: -2)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 15)
                                )
                        )
                        .frame(width: 250, height: 400)
                        
                    VStack{
                        HStack{
                            if(model.pallete.count > 0){
                                ForEach(0..<model.pallete.count, id: \.self) { row in
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color("background"))
                                            .frame(width: 60, height: 60)
                                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                            .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                                            
                                        Circle()
                                            .foregroundColor(Color(model.pallete[row]))
                                            .frame(width: 40, height: 40)
                                    }
                                    
                                    }
                            }else{
                                ForEach(0..<4, id: \.self) { row in
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color(red: 12, green: 12, blue: 12, opacity: 0))
                                    }
                            }
                        }//.padding()
                    }
                    //.padding()
                Button(action: {
                    for i in 0 ..< model.pallete.count  {
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
                        .font(Font.custom("Poppins-Regular", size: 16))
                    
                    
                }
            }
        }
        .cornerRadius(25.0)
        VStack{
        HStack(){
            Spacer()
            Button(action: {
                self.showPopover = false
            }) {
                Image(systemName: "xmark")
                    .font(Font.headline.weight(.bold))
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
            }
            
        }.padding(.horizontal)
            Spacer()

        }
        
    }
}

/*struct CreatePaletteView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePaletteView(showPopover: false, model: CreatePaletteViewModel())
    }
}*/
