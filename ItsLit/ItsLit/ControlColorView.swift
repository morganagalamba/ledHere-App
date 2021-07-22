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
    
    var body: some View {
            VStack{
                Text("Paleta de cores")
                    .padding()
                    .font(.title2)
                HStack{
                    Button(action: {
                        colorSelected[0].toggle()
                        for i in 0 ... 3{
                            if checkStatus[i] {
                                ledsColor[i] = pallet[0]
                            }
                            //print(i)
                        }
                    }) {
                        
                        if colorSelected[0] {
                            Circle()
                                .fill(pallet[0])
                                .frame(width: 50, height: 50)
                                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                        }
                        else{
                            Circle()
                                .fill(pallet[0])
                                .frame(width: 50, height: 50)
                        }
                          
                    }
                    Button(action: {
                        colorSelected[1].toggle()
                        for i in 0 ... 3{
                            if checkStatus[i] {
                                ledsColor[i] = pallet[1]
                            }
                            //print(i)
                        }
                    }) {
                        if colorSelected[1] {
                            Circle()
                                .fill(pallet[1])
                                .frame(width: 50, height: 50)
                                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                        }
                        else{
                            Circle()
                                .fill(pallet[1])
                                .frame(width: 50, height: 50)
                        }
                    }
                    Button(action: {
                        colorSelected[2].toggle()
                        for i in 0 ... 3{
                            if checkStatus[i] {
                                ledsColor[i] = pallet[2]
                            }
                            //print(i)
                        }
                    }) {
                        if colorSelected[2] {
                            Circle()
                                .fill(pallet[2])
                                .frame(width: 50, height: 50)
                                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                        }
                        else{
                            Circle()
                                .fill(pallet[2])
                                .frame(width: 50, height: 50)
                        }
                    }
                    Button(action: {
                        colorSelected[3].toggle()
                        for i in 0 ... 3{
                            if checkStatus[i] {
                                ledsColor[i] = pallet[3]
                            }
                            //print(i)
                        }
                    }) {
                        if colorSelected[3] {
                            Circle()
                                .fill(pallet[0])
                                .frame(width: 50, height: 50)
                                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                        }
                        else{
                            Circle()
                                .fill(pallet[3])
                                .frame(width: 50, height: 50)
                        }
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
                /*Button(action: {
                    
                }) {
                        Text("Salvar")
                            .frame(width: 100, height: 50)
                            .foregroundColor(.white)
                            .background(Color(UIColor.systemBlue))
                            .cornerRadius(8)

                }*/
            }.padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(25.0)
    }
}

/*struct ControlColorView_Previews: PreviewProvider {
    static var previews: some View {
        ControlColorView()
            .landscape()
    }
}*/
