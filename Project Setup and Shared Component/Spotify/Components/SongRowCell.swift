//
//  SongRowCell.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 15/04/24.
//

import SwiftUI

struct SongRowCell: View {
    var imageName: String = Constants.randomImage
    var title: String = "Some title goes here."
    var subTitle: String? = "Some artist name."
    var imageSize: CGFloat = 50
    var onEllipsisTapped: (() -> Void)?
    var onCellTapped: (() -> Void)?
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                if let subTitle {
                    Text(subTitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisTapped?()
                }
        }
        .onTapGesture {
            onCellTapped?()
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
