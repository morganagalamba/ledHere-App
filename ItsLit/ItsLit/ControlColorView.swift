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
            VStack{
                
                ColourWheelView(viewModel: ColourWheelViewModel(), rgbColour: $rgbColour, showPopover: $showPopover, pallet: $pallet, checkStatus: $checkStatus, ledsColor: $ledsColor)

            }.padding()
            .background(Color("background"))
            .cornerRadius(25.0)
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
        
    }

}
/*struct ControlColorView_Previews: PreviewProvider {
 static var previews: some View {
 ControlColorView()
 .landscape()
 }
 }*/
