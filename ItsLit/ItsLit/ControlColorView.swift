//
//  ControlColorView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct ControlColorView: View {
    @Binding var showPopover: Bool
    
    var body: some View {
        ZStack{
            VStack{
                Text("Paleta de cores")
                    .padding()
                    .font(.title2)
                HStack{
                    Button(action: {
                        
                    }) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 50, height: 50)
                    }
                    Button(action: {
                        
                    }) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                    }
                    Button(action: {
                        
                    }) {
                        Circle()
                            .fill(Color.pink)
                            .frame(width: 50, height: 50)
                    }
                    Button(action: {
                        
                    }) {
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 50, height: 50)
                    }
                    
                    Button(action: {
                        self.showPopover = true
                        
                    }) {
                            Image(systemName: "photo")
                                .frame(width: 100, height: 50)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .cornerRadius(8)
                    }
        
                }
                
                ColourWheelView(viewModel: ColourWheelViewModel())
                Button(action: {
                    
                }) {
                        Text("Salvar")
                            .frame(width: 100, height: 50)
                            .foregroundColor(.white)
                            .background(Color(UIColor.systemBlue))
                            .cornerRadius(8)

                }
            }.padding()
           
        }
     
        

    }
}

/*struct ControlColorView_Previews: PreviewProvider {
    static var previews: some View {
        ControlColorView()
            .landscape()
    }
}*/
