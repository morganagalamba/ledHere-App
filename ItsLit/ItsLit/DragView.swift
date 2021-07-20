//
//  DragView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 13/07/21.
//

import SwiftUI

struct DragView: View {
    @State var image = UIImage(named: "image")
    @State private var dragOver = false
    
    var body: some View {
        VStack{
                    let image = Image(uiImage: image ?? UIImage())
                    Rectangle()
                        .padding()
                        .overlay(image)
                }.onDrop(of: ["public.image"], isTargeted: $dragOver) { providers -> Bool in
                    providers.first?.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                        if let image = image as? UIImage {
                            DispatchQueue.main.async {
                                self.image = image
                            }
                        }
                    })
                    return true
                }
    }
    
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
