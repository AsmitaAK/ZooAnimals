//
//  ContentView.swift
//  ZooAnimals
//
//  Created by Asmita on 14/10/22.
//

import SwiftUI
struct ContentView: View {
@ObservedObject var zooAnimalsViewModel = ZooAnimalsViewModel()
@State var zooAnimals = [Animals]()
@State var showHeart = Bool()
var body: some View {
    NavigationView {
        List(zooAnimalsViewModel.animals, id: \.id) { animal in
            HStack{
                LazyImage(imageURL: animal.imageLink).frame(width: 100, height: 100).cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 10)

                VStack(alignment: .leading){
                    NavigationLink(destination: ZooAnimalsDetailView(animal: animal)) {
                        EmptyView()
                    }.opacity(0)
                    Text(animal.name).padding()
                    Spacer()
                    VStack{
                        Button(action: {
                            guard let index = zooAnimalsViewModel.animals.firstIndex(where: {$0.id == animal.id})else{ return }
                            zooAnimalsViewModel.animals[index].isLiked.toggle()
                        }, label: {
                            HStack {
                                Image(systemName:animal.isLiked ? "heart.fill" : "heart").foregroundColor(Color(.systemPink))
                                Text(animal.isLiked ? "dislike" : "Like").foregroundColor(Color(.systemPink))

                            }
                        }).buttonStyle(PlainButtonStyle())
                    }.padding()
                }
                
            }
            .navigationBarTitle("Zoo Animals", displayMode: .inline)//.padding()
        }
            .listStyle(PlainListStyle())
            .padding(-10.0)
            .onAppear() {
                zooAnimalsViewModel.getZooAnimalsData()
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
