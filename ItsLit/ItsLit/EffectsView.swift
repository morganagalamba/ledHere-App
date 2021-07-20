//
//  EffectsView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct EffectsView: View {
    var body: some View {
        VStack{
            Menu {
                Button {
                } label: {
                    Text("Piscar 2 cores")
                }
                Button {
                } label: {
                    Text("Trocar 3 cores")
                }
            } label: {
                HStack{
                    Text("Efeitos")
                    Spacer()
                    Image(systemName: "chevron.down")
                }.frame(width: 100, height: 50)
                .foregroundColor(.gray)
                .background(Color.white)
                .cornerRadius(8)
               
            }
        }.padding()
    }
}

struct EffectsView_Previews: PreviewProvider {
    static var previews: some View {
        EffectsView()
    }
}
