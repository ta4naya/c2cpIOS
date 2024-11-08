//
//  MainTabView.swift
//  c2cp
//
//  Created by mac on 01.05.24.
//

import SwiftUI
struct MainTabView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            BibleView()
                .tabItem {
                    Label("Bible", systemImage: "book")
                }
            
            PlansView()
                .tabItem {
                    Label("Plans", systemImage: "calendar")
                }
            
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
            
            MoreView()
                .tabItem {
                    Label("More", systemImage: "ellipsis.circle")
                }
        }
    }
}

#Preview {
    MainTabView()
}
