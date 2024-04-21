//
//  SpotifyPlayListView.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 14/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlayListView: View {
    @Environment(\.router) var router
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
    var product: Product =  .mockProduct
    var user: User =  .mockUser
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title ?? "",
                        subtilte: product.brand ?? "",
                        imageName: product.thumbnail ?? ""
                    )
                    .readingFrame { frame in
                        // frame.maxY = height of image cell
                        showHeader = frame.maxY < 150
                    }
                    PlaylistDescriptionCell(
                        descriptionText: product.description ?? "",
                        userName: user.firstName ?? "",
                        subHeadline: product.category ?? "",
                        onAddToPlayListPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                }
                ForEach(products) { product in
                    SongRowCell(
                        imageName: product.firstImage,
                        title: product.title ?? "",
                        subTitle: product.brand ?? "",
                        imageSize: 50,
                        onEllipsisTapped: nil,
                        onCellTapped: {
                            goToPlayListView(product: product)
                        }
                    )
                    .padding(.leading, 16)
                }
            }
            .scrollIndicators(.hidden)
            
            headerSection
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    private var headerSection: some View {
        ZStack {
            Text(product.title ?? "")
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(.spotifyBlack)
                .offset(y: showHeader ? 0 : -200)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? .black.opacity(0.001) : .spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
    private func goToPlayListView(product: Product) {
        router.showScreen(.fullScreenCover) { _ in
            SpotifyPlayListView(product: product, user: user)
        }
    }
    private func getData() async {
        guard products.isEmpty else { return }
        do {
            products = try await DatabaseHelper().getProduct() ?? []
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlayListView()
    }
}
