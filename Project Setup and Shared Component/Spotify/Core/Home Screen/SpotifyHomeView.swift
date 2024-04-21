//
//  SpotifyHomeView.swift
//  Spotify-Rebuild-UI
//
//  Created by Saurabh  Verma on 13/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    let router: AnyRouter
    @State var currentUser: User? = nil
    @State var selectedCategory: Category? = .all
    @State var products: [Product] = []
    @State var productRow: [ProductRow] = []
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(spacing: 16) {
                            recentSections
                            if let product = self.products.first {
                                self.newReleasedSection(product: product)
                            }
                            listRows
                        }
                    } header: {
                        headerView
                    }
                }
                .padding(.top, 8)
            }
            .clipped()
        }
        .task {
            await self.getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    private var headerView: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser = self.currentUser {
                    ImageLoaderView(urlString: currentUser.image ?? "")
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            // Write code to go to user profile view
                            self.router.dismissScreen()
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized,
                                            isSelected: category == self.selectedCategory
                        )
                        .onTapGesture {
                            self.selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 20)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
    private var recentSections: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: self.products) { product in
            if let product = product {
                SpotifyRecentsCells(imageName: product.firstImage, title: product.title ?? "")
                    .asButton(.press) {
                        goToPlayListView(product: product)
                    }
            }
        }
    }
    private func goToPlayListView(product: Product) {
        guard let currentUser = currentUser else { return }
        router.showScreen(.fullScreenCover) { _ in
            SpotifyPlayListView(product: product, user: currentUser)
        }
    }
    private func newReleasedSection(product: Product) -> some View {
        return SpotifyNewReleasedCell(
            imageName: product.firstImage,
            headline: product.brand,
            subHeadline: product.category,
            title: product.title,
            subTitle: product.description,
            onAddToPlaylistPressed: nil,
            playBtnTapped: {
                goToPlayListView(product: product)
            }
        )
    }
    private var listRows: some View {
        ForEach(productRow) { row in
            VStack(alignment: .leading, spacing: 8) {
                if let title = row.title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.spotifyWhite)
                        .lineLimit(1)
                }
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        ForEach(row.product ?? []) { item in
                            ImageTitleRowCell(
                                imageSize: 120,
                                imageName: item.firstImage,
                                title: item.title
                            )
                            .asButton(.press) {
                                goToPlayListView(product: item)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 16)
        }
    }
}
extension SpotifyHomeView {
    func getData() async {
        guard products.isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUsers()?.first
            products = try await Array(DatabaseHelper().getProduct()?.prefix(upTo: 8) ?? [])
            var rows: [ProductRow] = []
            let allBrands = Array(Set(products.map { $0.brand })) // removing dublicate
            for brand in allBrands {
                let _ = products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand, product: products))
            }
            productRow = rows
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
}

#Preview {
    RouterView { router in
        SpotifyHomeView(router: router)
    }
}
