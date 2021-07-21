//
//  SimulationView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct SimulationView: View {
    var body: some View {
        VStack{
            Button(action: {
                
            }) {
                VStack{
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 20, height:20)
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 20, height: 20)
                }
            }
            
            HStack{
                Button(action: {
                    
                }) {
                    HStack{
                        Circle()
                            .fill(Color.green)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.green)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.green)
                            .frame(width: 20, height: 20)
                    }
                }
                Button(action: {
                    
                }) {
                    HStack{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                    }
                }
               
            }
            Button(action: {
                
            }) {
                VStack{
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 20, height: 20)
                }
            }
            
            
            
            Button(action: {
                
            }) {
                Image(systemName: "power")
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }.padding(50)
        }
    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
    }
}
