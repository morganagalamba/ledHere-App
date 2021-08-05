//
//  ContentView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 06/07/21.
//

import SwiftUI
 
struct ContentView: View {
    @State private var showPopover: Bool = false
    @State var pallet: [Color] = [Color( red: 1, green: 0, blue: 0, opacity: 1) ,Color(red: 0, green: 0, blue: 1, opacity: 1) , Color(red: 1, green: 0.8, blue: 0.8, opacity: 1), Color(red: 0, green: 1, blue: 0, opacity: 1)]
    @State var checkStatus: [Bool] = [false, false, false, false]
    @State var rgbColour : RGB = RGB(r: 0, g: 1, b: 1)
    
    var body: some View {
        //ColourWheelView(viewModel: ColourWheelViewModel())
        //DragView()
        ProjectView(showPopover: $showPopover, pallet: $pallet, checkStatus: $checkStatus, rgbColour: $rgbColour)
        //CreatePaletteView(model: CreatePaletteViewModel())
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
