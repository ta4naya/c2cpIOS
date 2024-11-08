//
//  AppState.swift
//  c2cp
//
//  Created by mac on 01.05.24.
//

import Foundation
class AppState: ObservableObject {
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }

    init() {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    func logIn() {
        isLoggedIn = true
    }

    func logOut() {
        isLoggedIn = false
    }
}
