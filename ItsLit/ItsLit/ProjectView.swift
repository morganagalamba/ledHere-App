//
//  ProjectView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct ProjectView: View {
    @Binding var showPopover: Bool
    @Binding var pallet: [Color]
    @Binding var checkStatus: [Bool]
    @Binding var rgbColour : RGB
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            HStack{
                SimulationView(pallet: $pallet, checkStatus: $checkStatus)
                    .padding()
                Spacer()
                ZStack{
                    
                VStack{
                    ZStack{
                        ControlColorView(showPopover: $showPopover, pallet: $pallet, checkStatus: $checkStatus, rgbColour: $rgbColour)
                        if $showPopover.wrappedValue {
                            CreatePaletteView(showPopover: $showPopover, pallet: $pallet, model: CreatePaletteViewModel())
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                        }
                    }
                                
                    Button(action: {
                        
                    }) {
                            Text("Enviar")
                    }
                    .frame(width: 100, height: 50)
                    .foregroundColor(.gray)
                    .background(Color("background"))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 4 , y: 4)
                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -4, y: -4)
                }.padding()
            }}.padding(.horizontal,200)
            
        }//.background(Color(UIColor.systemGray5))
        //.animation(.easeInOut)
    }
}

//struct ProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectView(showPopover: true, pallet: $pallet, ledsColor: $ledsColor, checkStatus: $checkStatus, rgbColour: $rgbColour)
//            .landscape()
//    }
//}

struct LandscapeModifier: ViewModifier {
    let height = UIScreen.main.bounds.width
    let width = UIScreen.main.bounds.height
    
    var isPad: Bool {
        return height >= 768
    }
    
    var isRegularWidth: Bool {
        return height >= 414
    }
    
    func body(content: Content) -> some View {
        content
            .previewLayout(.fixed(width: width, height: height))
            .environment(\.horizontalSizeClass, isRegularWidth ? .regular: .compact)
            .environment(\.verticalSizeClass, isPad ? .regular: .compact)
    }
}

extension View {
    func landscape() -> some View {
        self.modifier(LandscapeModifier())
    }
}
