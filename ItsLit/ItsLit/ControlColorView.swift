//
//  ControlColorView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct ControlColorView: View {
    var body: some View {
            VStack{
                Text("Paleta de cores")
                    .padding()
                    .font(.title2)
                HStack{
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 50, height: 50)
                    Circle()
                        .fill(Color.green)
                        .frame(width: 50, height: 50)
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 50, height: 50)
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 50, height: 50)
                    Button(action: {
                        
                    }) {
                            Image(systemName: "photo")
                                .frame(width: 100, height: 50)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .cornerRadius(8)
                    }
        
                }
            
                //ColourWheelView(viewModel: ColourWheelViewModel())
                Button(action: {
                    
                }) {
                        Text("Salvar")
                            .frame(width: 100, height: 50)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(8)

                }
            }

    }
}

struct ControlColorView_Previews: PreviewProvider {
    static var previews: some View {
        ControlColorView()
            .landscape()
    }
}
