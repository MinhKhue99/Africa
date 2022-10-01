    //
    //  AnimalGridItemView.swift
    //  Africa
    //
    //  Created by Phạm Minh Khuê on 01/10/2022.
    //

import SwiftUI

struct AnimalGridItemView: View {
        // MARK: - PROPERTY
    let animal: Animal

        // MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(15)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
