//
//  HomeView.swift
//  c2cp
//
//  Created by mac on 01.05.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
            TabView {
                HomeFirstPageView()
                    .tabItem {
                        Text("Today")
                    }
                
                HomeSecondPageView()
                    .tabItem {
                        Text("Community")
                    }
            }
        }}


#Preview {
    HomeView()
}
