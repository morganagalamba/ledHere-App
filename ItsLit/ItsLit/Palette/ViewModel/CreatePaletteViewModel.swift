//
//  CreatePaletteViewModel.swift
//  ItsLit
//
//  Created by Lucas Silva on 20/07/21.
//

import Foundation
import swift_vibrant

class CreatePaletteViewModel: ObservableObject {
    @Published var pallete:[UIColor] = []
   
    func getPallete(image:UIImage){
        // Calling from a background thread
        Vibrant.from(image ?? UIImage()).getPalette({ palette in
            self.pallete = []
            self.pallete.append(palette.Muted?.uiColor ?? UIColor())
            self.pallete.append(palette.DarkMuted?.uiColor ?? UIColor())
            self.pallete.append(palette.LightVibrant?.uiColor ?? UIColor())
            self.pallete.append(palette.Vibrant?.uiColor ?? UIColor())
        })
    }
}
