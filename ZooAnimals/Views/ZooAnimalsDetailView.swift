//
//  ZooAnimalsDetailView.swift
//  ZooAnimals
//
//  Created by Asmita on 15/10/22.
//

import SwiftUI

struct ZooAnimalsDetailView: View {
    var animal: Animals
    var body: some View {
        VStack(alignment: .leading){
            LazyImage(imageURL: animal.imageLink)
                .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 10)
            Text(animal.latinName).font(.subheadline)
            Text(animal.activeTime).font(.subheadline)
            Text(animal.animalType).font(.subheadline)
            Text("LifeSpan : \(animal.lifespan)").font(.subheadline)
            Text("Habitat : \(animal.habitat)").font(.subheadline)
            Text("Diet : \(animal.diet)").font(.subheadline)
            Text("Geo Range : \(animal.geoRange)").font(.subheadline)
            Spacer()
        }.padding().background(Color.gray.opacity(0.5).edgesIgnoringSafeArea(.all))
        .navigationTitle(animal.name)
    }
}

struct ZooAnimalsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZooAnimalsDetailView(animal: Animals(name: "", latinName: "", animalType: "", activeTime: "", lengthMin: "", lengthMax: "", weightMin: "", weightMax: "", lifespan: "", habitat: "", diet: "", geoRange: "", imageLink: "", id: 0))
    }
}
