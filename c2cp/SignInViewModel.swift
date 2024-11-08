//
//  SignInViewModel.swift
//  c2cp
//
//  Created by mac on 01.05.24.
//
import Foundation
import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    @Published var  email = ""
    @Published var password = ""
    @Published var showAlert = false
    @Published var statusMessage = ""
    @Published var authenticationSuccess = false
    
    var appState: AppState

        init(appState: AppState) {
            self.appState = appState
        }
    func signInUser() {
        guard let url = URL(string: "https://covertocoverbible.org/api/account/login") else {  // Assuming this is the correct login URL
            statusMessage = "Invalid server URL."
            showAlert = true
            return
        }
        
        let parameters = [
            "Email": email,
            "Password": password
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.statusMessage = "Error occurred: \(error.localizedDescription)"
                    self.showAlert = true
                    self.authenticationSuccess = false
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    self.statusMessage = "Authentication successful."
                    self.authenticationSuccess = true
                    self.appState.logIn()
                } else {
                    self.statusMessage = "Authentication failed. Please check your credentials."
                    self.authenticationSuccess = false
                }
                
                self.showAlert = true
            }
        }.resume()
    }
}
