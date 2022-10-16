//
//  ImageDownloader.swift
//  ZooAnimals
//
//  Created by Asmita on 14/10/22.
//

import Foundation
import UIKit

class ImageDownloader: ObservableObject{
    @Published var downloadedImage: UIImage?
    private let imagePath : URL
    
    init(imageURL: String){
        self.imagePath = URL(string: imageURL)!
        getImage()
    }
    
    func getImage(){
        var urlRequest = URLRequest(url: self.imagePath)
        urlRequest.httpMethod = "get"
        URLSession.shared.dataTask(with: urlRequest){ [weak self] imageData,response,error in
            if (error == nil && imageData != nil) {
                DispatchQueue.main.async {
                    let resizedImage = UIImage(data: imageData!)?.resizeImage(with: CGSize(width: 100, height: 100))
                    self?.downloadedImage = resizedImage
                }
            }
        }.resume()
    }
}

extension UIImage {
    func resizeImage(with size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))

        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
