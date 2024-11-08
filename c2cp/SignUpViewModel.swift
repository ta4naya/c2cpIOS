import Foundation
import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showAlert = false
    @Published var statusMessage = ""
    @Published var responseBody = ""
    @Published var registrationSuccess = false
    func registerUser() {
        guard let url = URL(string: "https://covertocoverbible.org/api/account/register") else { return }
        
        let parameters = [
            "Email": email,
            "Password": password,
            "ConfirmPassword": confirmPassword
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error occurred: \(error)")
                self.statusMessage = "Error occurred: \(error)"
                self.registrationSuccess = true
                return
            }
            
         
            if let data = data, let responseBody = String(data: data, encoding: .utf8) {
                  print("Response Body: \(responseBody)")
                               }
            else {
                  print("No response body.")
                  return
            }           
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                  print("Error: Invalid response or status code.")
                return
              }
            print("Registration successful.")
            self.statusMessage = "Registation successful"
            self.registrationSuccess = true        }
        .resume()
    }
    
    func signInWithGoogle() {
        // Google sign-in logic
        print("Signing in with Google")
    }
    
    func signInWithFacebook() {
        // Facebook sign-in logic
        print("Signing in with Facebook")
    }
}
