//
//  ZooAnimalViewModel.swift
//  ZooAnimals
//
//  Created by Asmita on 14/10/22.
//

import Foundation

class ZooAnimalsViewModel: ObservableObject {
    @Published var animals : Array<Animals> = Array<Animals>()
    
    private let animalsResource = AnimalsResource()
    //Api call to get zoo animals data
    func getZooAnimalsData(){
        animalsResource.fetchZooAnimalsData { [weak self] response in
            if(response.count != 0){
                DispatchQueue.main.async {
                    self?.animals.append(contentsOf: response)
                }
            }
        }
    }
}
