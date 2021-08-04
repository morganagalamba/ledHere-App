//
//  SimulationView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct SimulationView: View {
    
    @Binding var pallet: [Color]
    @Binding var ledsColor: [Color]
    @Binding var checkStatus: [Bool] 
    
    var body: some View {
        VStack{
            Button(action: {
                checkStatus[0].toggle()
            }) {
                VStack{
                    /*if checkStatus[0] {
                        Image(systemName: "checkmark.square.fill")
                    } else {
                        Image(systemName: "square")
                    }*/
                    Circle()
                        .fill(ledsColor[0])
                        .frame(width: 20, height:20)
                    Circle()
                        .fill(ledsColor[0])
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(ledsColor[0])
                        .frame(width: 20, height: 20)
                    
                }
            }
            
            HStack{
                Button(action: {
                    checkStatus[1].toggle()
                }) {
                    HStack{
                        /*if checkStatus[1] {
                            Image(systemName: "checkmark.square.fill")
                        } else {
                            Image(systemName: "square")
                        }*/
                        Circle()
                            .fill(ledsColor[1])
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(ledsColor[1])
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(ledsColor[1])
                            .frame(width: 20, height: 20)
                        
                    }
                }
                Button(action: {
                    checkStatus[2].toggle()
                }) {
                    HStack{
                        Circle()
                            .fill(ledsColor[2])
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(ledsColor[2])
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(ledsColor[2])
                            .frame(width: 20, height: 20)
                        /*if checkStatus[2] {
                            Image(systemName: "checkmark.square.fill")
                        } else {
                            Image(systemName: "square")
                        }*/
                    }
                }
               
            }
            Button(action: {
                checkStatus[3].toggle()
            }) {
                VStack{
                    Circle()
                        .fill(ledsColor[3])
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(ledsColor[3])
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(ledsColor[3])
                        .frame(width: 20, height: 20)
                    /*if checkStatus[3] {
                        Image(systemName: "checkmark.square.fill")
                    } else {
                        Image(systemName: "square")
                    }*/
                }
            }
            
        }
    }
}

/*struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
    }
}*/
