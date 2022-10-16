//
//  Service.swift
//  ZooAnimals
//
//  Created by Asmita on 14/10/22.
//

import Foundation

struct AnimalsResource{
    
    func fetchZooAnimalsData(completionHandler:@escaping ([Animals]) -> ()) {
        guard let url = URL(string: "https://zoo-animal-api.herokuapp.com/animals/rand/10") else {
            return
        }
        HttpUtility.shared.getData(request: URLRequest(url: url), resulttype: [Animals].self) { response in
            _ = completionHandler(response!)
        }
    }
}
