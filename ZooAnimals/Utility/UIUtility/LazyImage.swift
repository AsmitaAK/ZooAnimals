//
//  LazyImage.swift
//  ZooAnimals
//
//  Created by Asmita on 14/10/22.
//

import Foundation
import SwiftUI
struct LazyImage: View{
    static var defaultImage: UIImage = UIImage(named: "default")!
    @ObservedObject var imageDownloader: ImageDownloader
    
    init(imageURL : String){
        imageDownloader = ImageDownloader(imageURL: imageURL)
    }
    var body : some View {
        VStack {
            Image(uiImage: imageDownloader.downloadedImage ?? LazyImage.defaultImage)
                .resizable()
                .scaledToFit()
        }
    }
}
struct LazyImage_PreviewProvider {
    static var previews: some View{
        LazyImage(imageURL: "")
    }
}
