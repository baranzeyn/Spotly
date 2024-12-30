//
//  NavigationCoordinator.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import Foundation
import SwiftUI

class NavigationCoordinator: ObservableObject {
    @Published var activeScreen: String?  // Bu, geçişleri kontrol eden ekran bilgisini tutar

    func navigateToSignIn() {
        activeScreen = "signIn"  // SignIn ekranına yönlendir
    }

    func navigateToSignUp() {
        activeScreen = "signUp"  // SignUp ekranına yönlendir
    }

    func navigateToHome() {
        activeScreen = "home"  // Ana ekrana yönlendir
    }

    func reset() {
        activeScreen = nil  // Yönlendirmeyi sıfırlayarak ekranları temizle
    }
}
