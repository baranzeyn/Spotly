//
//  SignInView.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isSignInSuccessful = false

    var body: some View {
        VStack {
            AuthView(
                title: "Welcome Back",
                actionButtonTitle: "Sign In",
                footerText: "Don't have an account? Sign Up",
                footerAction: switchToSignUp,
                actionButtonAction: signIn,
                email: $email,
                password: $password,
                dateOfBirth: nil
            )
            .alert(isPresented: $showAlert) {
                signInAlert
            }
        }
        .environmentObject(coordinator)
    }

    private func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            showAlert(message: "All fields are required")
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            handleAuthResult(error: error, successMessage: "User signed in successfully!")
        }
    }

    private func switchToSignUp() {
        withAnimation {
            coordinator.activeScreen = "signUp"  // Navigate to SignUp screen
        }
    }

    private func handleAuthResult(error: Error?, successMessage: String) {
        DispatchQueue.main.async {
            if let error = error {
                showAlert(message: "Error: \(error.localizedDescription)")
                isSignInSuccessful = false
            } else {
                showAlert(message: successMessage)
                isSignInSuccessful = true
            }
        }
    }

    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }

    private var signInAlert: Alert {
        Alert(
            title: Text("Sign In Status"),
            message: Text(alertMessage),
            dismissButton: .default(Text("OK")) {
                if isSignInSuccessful {
                    coordinator.activeScreen = "home"  // Navigate to Home
                }
            }
        )
    }
}
