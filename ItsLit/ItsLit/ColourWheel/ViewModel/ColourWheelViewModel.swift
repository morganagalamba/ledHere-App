//
//  ColourWheelViewModel.swift
//  ItsLit
//
//  Created by Eduardo Lopes on 09/07/21.
//

import Foundation
import swift_vibrant

protocol ColourWheelViewModelOutput {
    func encode(leds: LEDS) -> String
    func fill(rgb: RGB) -> LEDS
    func send(rgbColour: RGB) -> String
}

class ColourWheelViewModel: ColourWheelViewModelOutput {

    func encode(leds: LEDS) -> String {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(leds)
        return String(data: data, encoding: .utf8)!
    }
    
    func fill(rgb: RGB) -> LEDS {
        let leds = LEDS(
            l1: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l2: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l3: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l4: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l5: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l6: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l7: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l8: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l9: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l10: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l11: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)],
            l12: [Int(rgb.r*255),Int(rgb.g*255),Int(rgb.b*255)])
        return leds
    }
    
    func send(rgbColour: RGB) -> String {
        let ledsJson = encode(leds: fill(rgb: rgbColour))
        print(ledsJson)
        return ledsJson
    }
}
