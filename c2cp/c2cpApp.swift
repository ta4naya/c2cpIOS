//
//  c2cpApp.swift
//  c2cp
//
//  Created by mac on 21.04.24.
//

import SwiftUI

@main
struct c2cpart2App: App {
   
    @StateObject private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            if appState.isLoggedIn {
                MainTabView()
                .environmentObject(appState)            } else {
                SignUpView()
                .environmentObject(appState)            }
        }
    }
}
