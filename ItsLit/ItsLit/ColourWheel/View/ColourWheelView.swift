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
    @Binding var rgbColour : RGB
    @State var brightness: CGFloat = 1
    @Binding var showPopover: Bool
    @State private var colorSelected: [Bool] = [false,false,false,false]
    @Binding var pallet: [Color]
    @Binding var checkStatus: [Bool]
    @Binding var ledsColor: [Color]
    @State var blue: String
    
    
    
    var body: some View {
        VStack {
            /// The actual colour wheel.
            ColourWheel(radius: 150, rgbColour: $rgbColour, brightness: $brightness)
                .padding()
                .onAppear(perform: {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                })
            HStack{
                Image(systemName: "sun.min.fill")
                CustomSlider(rgbColour: $rgbColour, value: $brightness, range: (0...1))
                Image(systemName: "sun.max.fill")
                    .padding()
                //Text("\(brightness)").padding()
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            /// The slider shows the selected colour and allows control of the brightness/value. Cannot have value at 0 otherwise we lose the RGB value.
            
            HStack(alignment: .bottom){
                VStack{
                    
                    Button(action: {
                        colorSelected[0].toggle()
                        
                    }) {
                        if colorSelected[0] {
                            Image(systemName: "largecircle.fill.circle")
                        }
                        else{
                            Image(systemName: "circle")
                        }
                        
                    }
                    
                    Button(action: {
                        for i in 0 ... 3{
                            if checkStatus[i] {
                                ledsColor[i] = pallet[0]
                            }
                            
                        }
                    }) {
                        Circle()
                            .fill(pallet[0])
                            .frame(width: 35, height: 35)
                        
                    }
                }
                VStack{
                    Button(action: {
                        colorSelected[1].toggle()
                        
                    }) {
                        if colorSelected[1] {
                            Image(systemName: "largecircle.fill.circle")
                        }
                        else{
                            Image(systemName: "circle")
                        }
                        
                    }
                    Button(action: {
                        for i in 0 ... 3{
                            if checkStatus[i] {
                                ledsColor[i] = pallet[1]
                            }
                        }
                    }) {
                        Circle()
                            .fill(pallet[1])
                            .frame(width: 35, height: 35)
                        
                    }
                }
                VStack{
                    Button(action: {
                        colorSelected[2].toggle()
                        
                    }) {
                        if colorSelected[2] {
                            Image(systemName: "largecircle.fill.circle")
                        }
                        else{
                            Image(systemName: "circle")
                        }
                        
                    }
                    Button(action: {
                        for i in 0 ... 3{
                            if checkStatus[i] {
                                ledsColor[i] = pallet[2]
                            }
                        }
                    }) {
                        Circle()
                            .fill(pallet[2])
                            .frame(width: 35, height: 35)
                        
                    }
                }
                VStack{
                    Button(action: {
                        colorSelected[3].toggle()
                        
                    }) {
                        if colorSelected[3] {
                            Image(systemName: "largecircle.fill.circle")
                        }
                        else{
                            Image(systemName: "circle")
                        }
                        
                    }
                    Button(action: {
                        for i in 0 ... 3{
                            if checkStatus[i] {
                                ledsColor[i] = pallet[3]
                            }
                        }
                    }) {
                        Circle()
                            .fill(pallet[3])
                            .frame(width: 35, height: 35)
                        
                    }
                    
                }

            }
            HStack{
            VStack{
            HStack {
                CustomSlider(rgbColour: $rgbColour, value: $rgbColour.r, range: 0...1)
                    .padding(.horizontal)
                ZStack {
                    Text("\(rgbColour.r)")
                }.padding(.horizontal)
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            HStack {
                CustomSlider(rgbColour: $rgbColour, value: $rgbColour.g, range: 0...1)
                    .padding(.horizontal)
                
                ZStack {
                    Text("\(rgbColour.g)")
                }.padding(.horizontal)
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                CustomSlider(rgbColour: $rgbColour, value: $rgbColour.b, range: 0.001...1)
                    .padding(.horizontal)
                    .onAppear(perform: {
                        blue = String(format: "%.1f", rgbColour.b)
                    })

                ZStack {
                    TextField("StringProtocol", text: $blue) { trocou in
                        blue = String(format: "%.1f", rgbColour.b)
                    } onCommit: {
                        blue = String(format: "%.1f", rgbColour.b)
                    }

//                    TextField("", text: $blue)
//                    Text(String(format: "%.1f", rgbColour.b))
                }.padding(.horizontal)
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
                VStack{
                    Button(action: {
                        self.showPopover = true
                        
                    }) {
                        
                        Image(systemName: "photo")
                            .frame(width: 100, height: 50)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }
                }.padding()}
                
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
        
        
            
            
            
            /*Button(action: {
                viewModel.send(rgbColour: rgbColour)
            }, label: {
                Text("SEND")
            })*/
            /// If you don't want a brightness/value slider then remove it and use this instead to show the current colour.
            //            ColourShowView(rgbColour: $rgbColour)
        }
    }
}

/*struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        ColourWheelView(viewModel: ColourWheelViewModel())
        //            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
        //            .previewLayout(.fixed(width: 2732, height: 2048))
    }
}*/

