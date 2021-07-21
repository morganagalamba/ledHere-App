//
//  ProjectView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct ProjectView: View {
    
    @Binding var showPopover: Bool
    
    var body: some View {
        ZStack{
            Color(UIColor.systemGray5)
                .ignoresSafeArea()
            HStack{
                SimulationView()
                    .padding()
                //Spacer()
                VStack{
                    ControlColorView(showPopover: $showPopover)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(50.0)
                    EffectsView()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(25.0)
                    Button(action: {
                        
                    }) {
                            Text("Enviar")
                                .frame(width: 100, height: 50)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .cornerRadius(8)

                    }
                }.padding()
                
            }
            .padding(50)
            if $showPopover.wrappedValue {
                CreatePaletteView(showPopover: $showPopover, model: CreatePaletteViewModel())
                    .frame(width: 500, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1)
                    //.padding(.top, 350)
            }
        }.background(Color(UIColor.systemGray5))
        .animation(.easeInOut)
    }
}

/*struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
            .landscape()
    }
}*/

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
