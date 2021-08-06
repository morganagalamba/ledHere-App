//
//  CreatePaletteViewModel.swift
//  ItsLit
//
//  Created by Lucas Silva on 20/07/21.
// reference: https://medium.com/mackmobile/como-fazer-um-post-em-swift-4-2-8732ff61ceeb

import Foundation
import swift_vibrant

class CreatePaletteViewModel: ObservableObject {
    @Published var pallete:[UIColor] = []
   
    func getPallete(image:UIImage){
        // Calling from a background thread
        Vibrant.from(image ?? UIImage()).getPalette({ palette in
            self.pallete = []
            self.pallete.append(palette.Muted?.uiColor ?? UIColor())
            self.pallete.append(palette.LightMuted?.uiColor ?? UIColor())
            self.pallete.append(palette.LightVibrant?.uiColor ?? UIColor())
            self.pallete.append(palette.Vibrant?.uiColor ?? UIColor())
            
        })
    }
}
