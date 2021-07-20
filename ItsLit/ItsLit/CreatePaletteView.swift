//
//  CreatePaletteView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct CreatePaletteView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Criar Paleta")
                    .font(.title)
                Spacer()
            }
                
            DragView()
                VStack{
                    Text("Paleta de cores")
                        .padding()
                        .font(.title2)
                    HStack{
                        Circle()
                            .foregroundColor(.blue)
                        Circle()
                            .foregroundColor(.green)
                        Circle()
                            .foregroundColor(.pink)
                        Circle()
                            .foregroundColor(.purple)
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
        CreatePaletteView()
    }
}
