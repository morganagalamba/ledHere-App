//
//  ContentView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 06/07/21.
//

import SwiftUI
 
struct ContentView: View {
    @State private var showPopover: Bool = false
    @State var pallet: [Color] = [Color.red ,Color.blue , Color.pink, Color.green]
    @State var ledsColor: [Color] = [Color.red ,Color.blue , Color.pink, Color.green]
    @State var checkStatus: [Bool] = [false, false, false, false]
    @State var rgbColour : RGB = RGB(r: 0, g: 1, b: 1)
    
    var body: some View {
        //ColourWheelView(viewModel: ColourWheelViewModel())
        //DragView()
        ProjectView(showPopover: $showPopover, pallet: $pallet, ledsColor: $ledsColor, checkStatus: $checkStatus, rgbColour: $rgbColour)
        //CreatePaletteView(model: CreatePaletteViewModel())
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
