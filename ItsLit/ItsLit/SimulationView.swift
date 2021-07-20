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
            VStack{
                Circle()
                Circle()
                Circle()
            }
            HStack{
                HStack{
                    Circle()
                    Circle()
                    Circle()
                }
                HStack{
                    Circle()
                    Circle()
                    Circle()
                }
            }
            
            VStack{
                Circle()
                Circle()
                Circle()
            }
            
            
            Button(action: {
                
            }) {
                Image(systemName: "power")
                    .padding(10.0)
            }
        }
    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView()
    }
}
