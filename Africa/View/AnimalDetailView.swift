//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Phạm Minh Khuê on 02/09/2022.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - PROPERTY
    let animal: Animal

    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                //Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()

                //Title
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height:6)
                            .offset(y: 24))

                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                //Gallry
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Widerless in Picures")

                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)

                //Fact
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Do you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)

                //Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)

                //Map
                Group {
                    HeadingView(headingImage: "map", headingText: "National Park")
                    InsetMapView()
                }
                .padding(.horizontal)

                //Link
                HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                ExternalWeblinkView(animal: animal)
            }
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[1])
        }
    }
}
