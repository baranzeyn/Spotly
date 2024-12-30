//
//  SignUpView.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//
import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isRegistrationSuccessful = false

    var body: some View {
        VStack {
            AuthView(
                title: "Welcome",
                actionButtonTitle: "Sign Up",
                footerText: "Already have an account? Sign In",
                footerAction: switchToSignIn,
                actionButtonAction: signUp,
                email: $email,
                password: $password,
                dateOfBirth: nil
            )
            .alert(isPresented: $showAlert) {
                registrationAlert
            }
        }
        .environmentObject(coordinator)
    }

    private func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            showAlert(message: "All fields are required")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            handleAuthResult(error: error, successMessage: "Account created successfully!")
        }
    }

    private func switchToSignIn() {
        withAnimation {
            coordinator.activeScreen = "signIn"  // Navigate to SignIn screen
        }
    }

    private func handleAuthResult(error: Error?, successMessage: String) {
        DispatchQueue.main.async {
            if let error = error {
                showAlert(message: "Error: \(error.localizedDescription)")
                isRegistrationSuccessful = false
            } else {
                showAlert(message: successMessage)
                isRegistrationSuccessful = true
            }
        }
    }

    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }

    private var registrationAlert: Alert {
        Alert(
            title: Text("Registration Status"),
            message: Text(alertMessage),
            dismissButton: .default(Text("OK")) {
                if isRegistrationSuccessful {
                    coordinator.activeScreen = "home"  // Navigate to Home after successful registration
                }
            }
        )
    }
}
