//
//  MapAnotationView.swift
//  Africa
//
//  Created by Phạm Minh Khuê on 11/09/2022.
//

import SwiftUI

struct MapAnotationView: View {
    // MARK: - PROPERTY
    var location: NationalParkLocation
    @State private var animate: Double = 0.0

    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)

            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animate))
                .opacity(1 - animate)

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animate = 1
            }
        }
    }
}

struct MapAnotationView_Previews: PreviewProvider {
    static let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
