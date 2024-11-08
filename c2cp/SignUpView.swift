//
//  SignUpView.swift
//  c2cp
//
//  Created by mac on 21.04.24.
//

import Foundation
import SwiftUI
struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @StateObject private var appState = AppState()

    var body: some View {
        NavigationView {
            Form {
                TextField("Email", text: $viewModel.email)
                TextField("Name", text: $viewModel.name)
                SecureField("Password", text: $viewModel.password)
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                
            
                .pickerStyle(MenuPickerStyle())
                
                Button("Sign Up") {
                    viewModel.registerUser()
                }
                NavigationLink(destination:  SignInView(viewModel:SignInViewModel(appState: appState))) {
                                   Text("Already Registered? Sign In")
                               }
                Button("Sign in with Facebook") {
                    viewModel.signInWithFacebook()
                }
                
                Button("Sign in with Google") {
                    viewModel.signInWithGoogle()
                }
            }
            .navigationBarTitle("Sign Up")
            if !viewModel.statusMessage.isEmpty {
                            Text(viewModel.statusMessage)
                                .foregroundColor(viewModel.registrationSuccess ? .green : .red)
                                .bold()
                        }}
    }
}
