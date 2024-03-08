//
//  MainTabView.swift
//  AirbnbPractice
//
//  Created by Dongjun Lee on 3/7/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            WishlistsView()
                .tabItem {
                    Label("Wishlists", systemImage: "heart")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
