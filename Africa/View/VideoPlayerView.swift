//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Phạm Minh Khuê on 03/09/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROERTY
    var videoSelected: String
    var videoTitle: String

    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
                .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 6),
                alignment: .topLeading

                )
        }
        .tint(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
