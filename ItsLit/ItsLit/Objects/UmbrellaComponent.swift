//
//  UmbrellaComponent.swift
//  ItsLit
//
//  Created by Eduardo Lopes on 28/07/21.
//

import Foundation
import SwiftUI
import SceneKit

struct UmbrellaComponent: View {
    
    @State var models = [Model(id: 0, name: "Umbrella", modelName: "umbrella.usdc")]
    
    var body: some View{
        
        VStack{
            
            // Going to use SceneKit Scene View....
            
            // default is first object ie: Earth...
            
            // Scene View Has a default Camera View...
            // if you nedd custom means add there...
            
            SceneView(scene: SCNScene(named: models[0].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                // for user action...
                // setting custom frame...
                .frame(width: UIScreen.main.bounds.width/4 , height: UIScreen.main.bounds.height / 4)
//            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical,30)
                
            
        }
    }
}

struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
}
