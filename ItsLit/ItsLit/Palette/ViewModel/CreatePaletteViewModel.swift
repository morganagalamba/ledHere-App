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
            self.pallete.append(palette.LightMuted?.uiColor ?? UIColor())
            self.pallete.append(palette.LightVibrant?.uiColor ?? UIColor())
            self.pallete.append(palette.Vibrant?.uiColor ?? UIColor())
        })
    }
    func send(effect:Int, colors:[[Float]]){
        var setup = LightsSetup(Effect: effect,ColorSetup: colors)
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(setup)
            let json = String(data: jsonData, encoding: String.Encoding.utf16)
        } catch {
            print(error)
        }
    }
}
