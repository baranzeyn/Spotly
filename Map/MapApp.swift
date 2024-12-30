//
//  MapApp.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import SwiftUI
import Firebase

@main
struct MapApp: App {
    @StateObject private var coordinator = NavigationCoordinator()
    @StateObject private var locationsViewModel = LocationsViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)
                .environmentObject(locationsViewModel)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        // Eğer activeScreen nil değilse, doğru ekranı göster
        SplashView()
            .fullScreenCover(isPresented: Binding(
                get: { coordinator.activeScreen != nil },
                set: { if !$0 { coordinator.reset() } }
            )) {
                // activeScreen değerine göre uygun ekranı göster
                switch coordinator.activeScreen {
                case "signIn":
                    SignInView()
                case "signUp":
                    SignUpView()
                case "home":
                    LocationsView()
                default:
                    SplashView()  // Varsayılan olarak SplashView
                }
            }
    }
}
