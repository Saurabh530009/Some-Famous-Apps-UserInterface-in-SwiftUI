//
//  ContentView.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 13/04/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    @Environment(\.router) var router
    var body: some View {
        List {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) { router in
                    SpotifyHomeView(router: router)
                }
            }
        }
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
