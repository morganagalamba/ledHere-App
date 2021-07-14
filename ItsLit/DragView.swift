//
//  DragView.swift
//  ItsLit
//
//  Created by Morgana Galamba on 13/07/21.
//

import SwiftUI

struct DragView: View {
    @State var image = UIImage(named: "image")
    //@State var urlImage: URL = URL(fileURLWithPath: "")
    @State var urlImage: String = "file:///var/tmp/com.apple.DragUI.druid/.com.apple.DragUI.1YSvR5/version=1&uuid=342C5348-8856-458A-8710-681B9C1FBF4B&mode=compatible.jpeg"
    //@State var image: Image = Image(uiImage: UIImage())
    @State private var dragOver = false
    
    var body: some View {
        VStack{
            
            //let imageData = NSData(contentsOf: urlImage)
            Image(uiImage: image ?? UIImage())
            Rectangle()
                .padding()
                //.overlay(Image(uiImage: urlImage))
        }.onDrop(of: ["public.file-url"], isTargeted: $dragOver) { providers -> Bool in
            providers.first?.loadDataRepresentation(forTypeIdentifier: "public.file-url", completionHandler: { (data, error) in
                if let data = data, let path = NSString(data: data, encoding: 4){
                    let image = UIImage(contentsOfFile: String(path))
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            })
            return true
        }
        //.onDrop(of: ["public.file-url"], delegate: URLDropDelegate(urlImage: $urlImage))
    }
    
}

struct URLDropDelegate: DropDelegate {
    @Binding var urlImage: String
 
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
        if let item = info.itemProviders(for: ["public.file-url"]).first {
            
            item.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (urlData, error) in
                DispatchQueue.main.async {
                    if let urlData = urlData {

                        let url = urlData as! NSURL
                        let urlString: String = url.absoluteString!
                        var urlUrl = URL(string: urlString)
                        //urlUrl?.loadImage(<#T##image: &UIImage?##UIImage?#>)
                        //self.urlImage = loadImage(at: urlString) ?? UIImage()
                        self.urlImage = urlString
                        print(urlData)
                        print(urlImage)
                    }
                }
            }
        }

        return true
    }
    
    func loadImage(at path: String) -> UIImage? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentPath = paths[0]
        let imagePath = documentPath.appending(path)
        guard fileExists(at: imagePath) else {
            return nil
        }
        guard let image = UIImage(contentsOfFile: imagePath) else {
            return nil
        }
        return image
    }

    func fileExists(at path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
}

extension URL {
    func loadImage(_ image: inout UIImage?) {
        if let data = try? Data(contentsOf: self), let loaded = UIImage(data: data) {
            image = loaded
        } else {
            image = nil
        }
    }
    func saveImage(_ image: UIImage?) {
        if let image = image {
            if let data = image.jpegData(compressionQuality: 1.0) {
                try? data.write(to: self)
            }
        } else {
            try? FileManager.default.removeItem(at: self)
        }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
