//
//  ContentView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 06/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ColourWheelView(viewModel: ColourWheelViewModel())
        //DragView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
