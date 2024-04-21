//
//  PlaylistDescriptionCell.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 14/04/24.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    var descriptionText: String = Product.mockProduct.description ?? ""
    var userName: String = "Saurabh"
    var subHeadline: String = "Some headlines goes here."
    var onAddToPlayListPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var body: some View {
        VStack(alignment: .leading) {
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
            HStack(spacing: 8) {
                Image(systemName: "applelogo")
                    .font(.title3)
                    .foregroundStyle(.spotifyGreen)
                madeForYouSection
            }
            Text(subHeadline)
            
            buttonsRows
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        Text("Made for ")
        +
        Text(userName)
            .bold()
            .foregroundStyle(.spotifyWhite)
    }
    private var buttonsRows: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onAddToPlayListPressed?()
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onDownloadPressed?()
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onSharePressed?()
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
            }
            .foregroundStyle(.spotifyGreen)
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        PlaylistDescriptionCell()
    }
}
