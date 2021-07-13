//
//  DragView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 13/07/21.
//

import SwiftUI

struct DragView: View {
    @State var urlImage: URL = URL(fileURLWithPath: "")

    var body: some View {
        VStack{
            
            //let imageData = NSData(contentsOf: urlImage)
            
            //let image = Image(uiImage: UIImage(data: imageData as! Data) ?? UIImage())
            
            Rectangle()
                .padding()
                //.overlay(image)
        }.onDrop(of: ["public.jpeg"], delegate: URLDropDelegate(urlImage: $urlImage))
    }
}

struct URLDropDelegate: DropDelegate {
    @Binding var urlImage: URL
 
    func performDrop(info: DropInfo) -> Bool {
        
        /*guard info.hasItemsConforming(to: ["public.url"]) else {
            print("chegou aqui")
            return false

        }*/

        /*let items = info.itemProviders(for: ["public.url"])
        print(items)
        for item in items {
            _ = item.loadObject(ofClass: URL.self) { url, _ in
                if let url = url {
                    DispatchQueue.main.async {
                        //self.urlItems.insert(URLItem(link: url), at: 0)
                        self.urlImage = url
                        print(url)
                        
                    }
                }
            }
        }*/
        if let item = info.itemProviders(for: ["public.jpeg"]).first {
            
            item.loadItem(forTypeIdentifier: "public.jpeg", options: nil) { (urlData, error) in
                DispatchQueue.main.async {
                    
                    //print(urlData)
                    if let urlData = urlData {
                        //self.imageUrls[gridPosition] = NSURL(absoluteURLWithDataRepresentation: urlData, relativeTo: nil) as URL
                        //self.urlImage = URL(fileURLWithPath: urlData as! String)
                            //urlData
                        print("ta aqui")
                        print(urlData)
                    }
                }
            }
        }

        return true
    }
}

/*struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}*/
