//
//  HeadingView.swift
//  Africa
//
//  Created by Phạm Minh Khuê on 02/09/2022.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - PROPERTY
    var headingImage: String
    var headingText: String
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Widerless in Picures")
    }
}
