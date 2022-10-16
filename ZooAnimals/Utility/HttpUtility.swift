//
//  HttpUtility.swift
//  ZooAnimals
//
//  Created by Asmita on 14/10/22.
//

import Foundation

final class HttpUtility {
    
    static let shared = HttpUtility()
    private init (){}
    
    func getData<T:Decodable>(request: URLRequest, resulttype: T.Type, completionHandler: @escaping(_ result: T?)->Void){
        URLSession.shared.dataTask(with: request) { data, response, error in
            if(error == nil && data != nil){
                let response = try? JSONDecoder().decode(resulttype.self, from: data!)
                _ = completionHandler(response)
            }
            
        }.resume()
    }
}
