//
//  MapView.swift
//  Africa
//
//  Created by Phạm Minh Khuê on 01/09/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTY
    @State private var region: MKCoordinateRegion = {

        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600268, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates,span: mapZoomLevel)

        return mapRegion
    } ()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    // MARK: - BODY
    var body: some View {

        // MARK: - No1. Basic Map
        //Map(coordinateRegion: $region)

        // MARK: - No2. Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations,
            annotationContent: {item in

            // (A) PIN: old style (always static)
            //MapPin(coordinate: item.location, tint: .accentColor)

            // (B) MARKER: new style (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)

            // (C) CUSTOM BASIC ANOTATION
            MapAnnotation(coordinate: item.location) {
                MapAnotationView(location: item)
            }
        })
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)

                VStack(alignment: .leading, spacing: 3) {
                    Divider()
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)

                        Spacer()

                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }

                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                        Spacer()

                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }

            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding(),
            alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
