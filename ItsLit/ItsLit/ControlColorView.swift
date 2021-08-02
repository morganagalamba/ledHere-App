//
//  ControlColorView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct ControlColorView: View {
    @Binding var showPopover: Bool
    @Binding var pallet: [Color]
    @Binding var checkStatus: [Bool]
    @Binding var ledsColor: [Color]
    @State private var colorSelected: [Bool] = [false,false,false,false]
    @Binding var rgbColour : RGB
    
    var body: some View {
        ZStack{
            Image("Rectangle 5")
                .resizable()
//                .fixedSize(horizontal: 570, vertical: 1000)
                .frame(width: 350, height: 559, alignment: .center)
            VStack{
//                Text("Paleta de cores")
//                    .padding()
//                    .font(.title2)
                
                
                
                ColourWheelView(viewModel: ColourWheelViewModel(), rgbColour: $rgbColour, showPopover: $showPopover, pallet: $pallet, checkStatus: $checkStatus, ledsColor: $ledsColor)
                Button(action: {
                    
                    for i in 0 ... 3 {
                        
                        if colorSelected[i] {
                            pallet[i] = Color(red: Double(rgbColour.r), green: Double(rgbColour.g), blue: Double(rgbColour.b))
                        }
                        
                    }
                }) {
                    Text("Salvar")
                        .frame(width: 100, height: 50)
                        .foregroundColor(.white)
                        .background(Color(UIColor.systemBlue))
                        .cornerRadius(8)
                    
                }
            }}.padding()
//            .background(Color(UIColor.systemGray6))
            .cornerRadius(25.0)
        }
    }


/*struct ControlColorView_Previews: PreviewProvider {
 static var previews: some View {
 ControlColorView()
 .landscape()
 }
 }*/
