//
//  SignInView.swift
//  c2cp
//
//  Created by mac on 01.05.24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: SignInViewModel
    var body: some View {
        NavigationView {
            Form {
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)  // Ensure usernames are entered in lowercase
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $viewModel.password)
                
                Button("Sign In") {
                    viewModel.signInUser()
                }
                .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)

                if !viewModel.statusMessage.isEmpty {
                    Text(viewModel.statusMessage)
                        .foregroundColor(viewModel.authenticationSuccess ? .green : .red)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .navigationBarTitle("Sign In", displayMode: .inline)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Authentication Status"), message: Text(viewModel.statusMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}
