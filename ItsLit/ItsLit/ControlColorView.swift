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
                        .foregroundColor(.blue)
                    Circle()
                        .foregroundColor(.green)
                    Circle()
                        .foregroundColor(.pink)
                    Circle()
                        .foregroundColor(.purple)
                    Button(action: {
                        
                    }) {
                        Image(systemName: "photo")
                            
                    }
                    
                }.padding()
                ColourWheelView(viewModel: ColourWheelViewModel())
            }

    }
}

struct ControlColorView_Previews: PreviewProvider {
    static var previews: some View {
        ControlColorView()
            .landscape()
    }
}
