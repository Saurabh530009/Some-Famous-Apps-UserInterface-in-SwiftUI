//
//  SpotifyNewReleasedCell.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 14/04/24.
//

import SwiftUI

struct SpotifyNewReleasedCell: View {
    var imageName: String = Constants.randomImage
    var headline: String? = "New released from"
    var subHeadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subTitle: String? = "Single - Title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var playBtnTapped: (() -> Void)? = nil
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading,spacing: 2) {
                    if let headline {
                        Text(headline)
                            .font(.callout)
                            .foregroundStyle(.spotifyLightGray)
                            .lineLimit(1)
                    }
                    if let subHeadline {
                        Text(subHeadline)
                            .font(.title2)
                            .foregroundStyle(.spotifyWhite)
                            .lineLimit(1)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 16) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                                .lineLimit(2)
                        }
                        if let subTitle {
                            Text(subTitle)
                                .foregroundStyle(.spotifyLightGray)
                                .lineLimit(2)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                self.onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title)
                            .padding(2)
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                self.playBtnTapped?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyNewReleasedCell()
            .padding()
    }
}
