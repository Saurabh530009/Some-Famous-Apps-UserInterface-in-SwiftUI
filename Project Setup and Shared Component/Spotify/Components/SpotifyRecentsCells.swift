//
//  SpotifyRecentsCells.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 14/04/24.
//

import SwiftUI

struct SpotifyRecentsCells: View {
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    var isSelected: Bool = false
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyRecentsCells()
                SpotifyRecentsCells()

            }
            HStack {
                SpotifyRecentsCells()
                SpotifyRecentsCells()

            }
        }
    }
}
