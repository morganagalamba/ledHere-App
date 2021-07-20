//
//  ProjectView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 20/07/21.
//

import SwiftUI

struct ProjectView: View {
    var body: some View {
        HStack{
            SimulationView()
            ControlColorView()
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
            .landscape()
    }
}

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
