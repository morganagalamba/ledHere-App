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
    
    
    var body: some View {
        VStack {
            /// The actual colour wheel.
            ZStack{
                Circle()
                    .fill(Color("background"))
                    .frame(width: 230, height: 230)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                ColourWheel(radius: 210, rgbColour: $rgbColour, brightness: $brightness)
                   
            } .padding([.top, .leading, .trailing])
            
            HStack(alignment: .top){
                Image(systemName: "sun.min.fill")
                    .foregroundColor(.gray)
                CustomSlider(rgbColour: $rgbColour, value: $brightness, range: (0...1))
                    .frame(width: 125)
                    .background(Color("background"))
                    
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.gray)
            }.padding(.top,10)
            /// The slider shows the selected colour and allows control of the brightness/value. Cannot have value at 0 otherwise we lose the RGB value.
            HStack(alignment: .bottom){

                    
                    
                    Button(action: {
                        colorSelected[0].toggle()
                        colorSelected[1] = false
                        colorSelected[2] = false
                        colorSelected[3] = false

                        if !colorSelected[0] {
                            pallet[0] = Color(red: Double(rgbColour.r), green: Double(rgbColour.g), blue: Double(rgbColour.b))
                        } else {
                            rgbColour.r = CGFloat(pallet[0].cgColor!.components![0])
                            rgbColour.g = CGFloat(pallet[0].cgColor!.components![1])
                            rgbColour.b = CGFloat(pallet[0].cgColor!.components![2])
                        }
                    }) {
                        if colorSelected[0] {
                            ZStack{
                                
                                Circle()
                                    .fill(Color("background"))
                                    .frame(width: 50, height: 50)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                                Circle()
                                    .fill(Color.init(red: Double(self.rgbColour.r), green: Double(self.rgbColour.g), blue: Double(self.rgbColour.b)))
                                    .frame(width: 45, height: 45)
                                    
                            }
                        }
                        else{
                            ZStack{
                                Circle()
                                    .fill(Color("background"))
                                    .frame(width: 50, height: 50)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                                Circle()
                                    .fill(pallet[0])
                                    .frame(width: 35, height: 35)
                                    
                            }
                        }
                        
                        
                    }.padding(.horizontal,5)

                    
                Button(action: {
                    colorSelected[1].toggle()
                    colorSelected[0] = false
                    colorSelected[2] = false
                    colorSelected[3] = false
                    if !colorSelected[1] {
                        pallet[1] = Color(red: Double(rgbColour.r), green: Double(rgbColour.g), blue: Double(rgbColour.b))
                    } else {
                        rgbColour.r = CGFloat(pallet[1].cgColor!.components![0])
                        rgbColour.g = CGFloat(pallet[1].cgColor!.components![1])
                        rgbColour.b = CGFloat(pallet[1].cgColor!.components![2])
                    }
                }) {
                    if colorSelected[1] {
                        ZStack{
                            
                            Circle()
                                .fill(Color("background"))
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                            Circle()
                                .fill(Color.init(red: Double(self.rgbColour.r), green: Double(self.rgbColour.g), blue: Double(self.rgbColour.b)))
                                .frame(width: 45, height: 45)
                            
                        }
                    }
                    else{
                        ZStack{
                            Circle()
                                .fill(Color("background"))
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                            Circle()
                                .fill(pallet[1])
                                .frame(width: 35, height: 35)
                            
                        }
                    }
                    
                    
                }.padding(.horizontal,5)


                Button(action: {
                    colorSelected[2].toggle()
                    colorSelected[1] = false
                    colorSelected[0] = false
                    colorSelected[3] = false
                    if !colorSelected[2] {
                        pallet[2] = Color(red: Double(rgbColour.r), green: Double(rgbColour.g), blue: Double(rgbColour.b))
                    } else {
                        rgbColour.r = CGFloat(pallet[2].cgColor!.components![0])
                        rgbColour.g = CGFloat(pallet[2].cgColor!.components![1])
                        rgbColour.b = CGFloat(pallet[2].cgColor!.components![2])
                    }
                }) {
                    if colorSelected[2] {
                        ZStack{
                            
                            Circle()
                                .fill(Color("background"))
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                            Circle()
                                .fill(Color.init(red: Double(self.rgbColour.r), green: Double(self.rgbColour.g), blue: Double(self.rgbColour.b)))
                                .frame(width: 45, height: 45)
                            
                        }
                    }
                    else{
                        ZStack{
                            Circle()
                                .fill(Color("background"))
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                            Circle()
                                .fill(pallet[2])
                                .frame(width: 35, height: 35)
                            
                        }
                    }
                    
                    
                }.padding(.horizontal,5)
                
                
                Button(action: {
                    colorSelected[3].toggle()
                    colorSelected[1] = false
                    colorSelected[2] = false
                    colorSelected[0] = false
                    if !colorSelected[3] {
                        pallet[3] = Color(red: Double(rgbColour.r), green: Double(rgbColour.g), blue: Double(rgbColour.b))
                    } else {
                        rgbColour.r = CGFloat(pallet[3].cgColor!.components![0])
                        rgbColour.g = CGFloat(pallet[3].cgColor!.components![1])
                        rgbColour.b = CGFloat(pallet[3].cgColor!.components![2])
                    }
                }) {
                    if colorSelected[3] {
                        ZStack{
                            
                            Circle()
                                .fill(Color("background"))
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                            Circle()
                                .fill(Color.init(red: Double(self.rgbColour.r), green: Double(self.rgbColour.g), blue: Double(self.rgbColour.b)))
                                .frame(width: 45, height: 45)
                            
                        }
                    }
                    else{
                        ZStack{
                            Circle()
                                .fill(Color("background"))
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                            Circle()
                                .fill(pallet[3])
                                .frame(width: 35, height: 35)
                            
                        }
                    }
                    
                    
                }.padding(.horizontal,5)
                
            }.padding(.vertical)
            HStack(alignment: .center) {
                VStack{
                    HStack(alignment: .top) {
                        Text("R")
                            .font(.footnote)
                            .frame(width: 20, height: 20, alignment: .bottom)
                            .foregroundColor(.gray)
                        CustomSlider(rgbColour: $rgbColour, value: $rgbColour.r, range: 0...1)
                            .frame(width: 85)
                            .foregroundColor(.gray)
                            .background(Color("background"))
                        ZStack {
                            Text(String(format: "%.f", rgbColour.r*255))
                                .frame(minWidth: 40)
                                .foregroundColor(.gray)
                        }//.padding(.horizontal)
                    }//.frame(width: 150, alignment: .center)
                    HStack(alignment: .top)  {
                        Text("G")
                            .font(.footnote)
                            .frame(width: 20, height: 20, alignment: .bottom)
                            .foregroundColor(.gray)
                        CustomSlider(rgbColour: $rgbColour, value: $rgbColour.g, range: 0...1)
                            .frame(width: 85)
                        ZStack {
                            Text(String(format: "%.f", rgbColour.g*255))
                                .frame(minWidth: 40)
                                .foregroundColor(.gray)
                        }//.padding(.horizontal)
                    }//.frame(width: 150, alignment: .center)
                    HStack (alignment: .top) {
                        Text("B")
                            .font(.footnote)
                            .frame(width: 20, height: 20, alignment: .bottom)
                            .foregroundColor(.gray)
                        CustomSlider(rgbColour: $rgbColour, value: $rgbColour.b, range: 0.001...1)
                            .frame(width: 85)
                        
                        ZStack {
                            Text(String(format: "%.f", rgbColour.b*255))
                                .frame(minWidth: 40)
                                .foregroundColor(.gray)
                        }
                        //.padding(.horizontal)
                    }//.frame(width: 150, alignment: .center)
                }
                    Button(action: {
                        self.showPopover = true
                    }) {
                        Image(systemName: "photo")
                            .frame(width: 56, height: 36)
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                    }
                    .foregroundColor(.gray)
                    .background(Color("background"))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                }
//            Button(action: {
//                for i in 0 ... 3 {
//                    if colorSelected[i] {
//                        pallet[i] = Color(red: Double(rgbColour.r), green: Double(rgbColour.g), blue: Double(rgbColour.b))
//                        colorSelected[i] = false
//                    }
//                }
//            }) {
//                Text("Salvar")
//                    .frame(width: 100, height: 50)
//                    .foregroundColor(.gray)
//                    .background(Color("background"))
//                    .cornerRadius(8)
//                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
//                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
//            }.padding(.vertical)
        }//.frame(width: 267.0, height: 475.0)
    }
}

/*struct FinalView_Previews: PreviewProvider {
 static var previews: some View {
 ColourWheelView(viewModel: ColourWheelViewModel())
 //            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
 //            .previewLayout(.fixed(width: 2732, height: 2048))
 }
 }*/

