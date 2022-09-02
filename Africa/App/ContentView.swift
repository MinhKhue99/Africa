//
//  ContentView.swift
//  Africa
//
//  Created by Phạm Minh Khuê on 01/09/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    let animals: [Animal] = Bundle.main.decode("animals.json")

    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) {item in
                    AnimalListItemView(animal: item)
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
