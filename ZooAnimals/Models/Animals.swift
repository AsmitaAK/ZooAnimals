//
//  Animals.swift
//  ZooAnimals
//
//  Created by Asmita on 14/10/22.
//

import Foundation

struct Animals: Codable, Identifiable {
    let name, latinName: String
    let animalType: String
    let activeTime: String
    let lengthMin, lengthMax, weightMin, weightMax: String
    let lifespan, habitat, diet, geoRange: String
    let imageLink: String
    let id: Int
    var isLiked:Bool = false

    enum CodingKeys: String, CodingKey {
        case name
        case latinName = "latin_name"
        case animalType = "animal_type"
        case activeTime = "active_time"
        case lengthMin = "length_min"
        case lengthMax = "length_max"
        case weightMin = "weight_min"
        case weightMax = "weight_max"
        case lifespan, habitat, diet
        case geoRange = "geo_range"
        case imageLink = "image_link"
        case id
    }
}

enum ActiveTime: String, Codable {
    case diurnal = "Diurnal"
    case nocturnal = "Nocturnal"
}

enum AnimalType: String, Codable {
    case amphibian = "Amphibian"
    case mammal = "Mammal"
    case reptile = "Reptile"
}
