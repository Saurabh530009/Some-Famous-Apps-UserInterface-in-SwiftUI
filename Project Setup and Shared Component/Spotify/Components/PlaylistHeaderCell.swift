//
//  PlaylistHeaderCell.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 14/04/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    var height: CGFloat = 300
    var title: String = "Some Playlist title goes here"
    var subtilte: String = "Subtitle goes here"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = Color.spotifyBlack.opacity(0.8)
    var body: some View {
        Rectangle()
            .overlay(
                ImageLoaderView(urlString: imageName)
            )
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.headline)
                        .lineLimit(1)
                    Text(subtilte)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .lineLimit(1)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                )
                
            }
            .asStretchyHeader(startingHeight: 300)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
