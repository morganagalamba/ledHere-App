//
//  ContentView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 06/07/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopover: Bool = false
    
    var body: some View {
        //ColourWheelView(viewModel: ColourWheelViewModel())
        //DragView()
        ProjectView(showPopover: $showPopover)
        //CreatePaletteView(model: CreatePaletteViewModel())
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
