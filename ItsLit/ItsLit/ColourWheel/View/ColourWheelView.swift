//
//  FinalView.swift
//  Colour Wheel
//
//  Created by Christian P on 9/6/20.
//  Copyright © 2020 Christian P. All rights reserved.
//

import SwiftUI

/// The final view that presents everything.
struct ColourWheelView: View {
    
    var viewModel: ColourWheelViewModel
    
    /// Source of truth of the colour that will be presented as well as controlled with the colour wheel.
    @State var rgbColour = RGB(r: 0, g: 1, b: 1)
    @State var brightness: CGFloat = 1
    
    var body: some View {
        VStack {
            
            /// The actual colour wheel.
            ColourWheel(radius: 150, rgbColour: $rgbColour, brightness: $brightness)
                .padding()
            
            /// The slider shows the selected colour and allows control of the brightness/value. Cannot have value at 0 otherwise we lose the RGB value.
            HStack{
            CustomSlider(rgbColour: $rgbColour, value: $brightness, range: (0...1))
                .padding()
                Text("\(brightness)").padding()
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                CustomSlider(rgbColour: $rgbColour, value: $rgbColour.r, range: 0...1)
                    .padding()
                
                ZStack {
                    Text("\(rgbColour.r)")
                }.padding()
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            HStack {
                CustomSlider(rgbColour: $rgbColour, value: $rgbColour.g, range: 0...1)
                    .padding()
                
                ZStack {
                    Text("\(rgbColour.g)")
                }.padding()
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                CustomSlider(rgbColour: $rgbColour, value: $rgbColour.b, range: 0.001...1)
                    .padding()
                
                ZStack {
                    Text("\(rgbColour.b)")
                }.padding()
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Button(action: {
                viewModel.send(rgbColour: rgbColour)
            }, label: {
                Text("SEND")
            })
            /// If you don't want a brightness/value slider then remove it and use this instead to show the current colour.
            //            ColourShowView(rgbColour: $rgbColour)
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        ColourWheelView(viewModel: ColourWheelViewModel())
        //            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
        //            .previewLayout(.fixed(width: 2732, height: 2048))
    }
}

