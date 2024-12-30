//
//  Onboarding.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import SwiftUI

struct Onboard: Identifiable {
    let id: UUID
    let title: String
    let description: String
}

struct Onboarding: View {
    @State private var index = 0
    @EnvironmentObject var coordinator: NavigationCoordinator

    private let onboardingItems: [Onboard] = [
        Onboard(id: UUID(), title: "Analyze Reviews", description: "Our app helps you analyze user reviews to gain insights and understand customer sentiment easily."),
        Onboard(id: UUID(), title: "Sentiment Insights", description: "Get detailed sentiment analysis of reviews to make informed decisions based on positive, neutral, or negative feedback."),
        Onboard(id: UUID(), title: "Track Trends", description: "Track trends in customer sentiment over time to identify patterns and improve your services.")
    ]

    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $index) {
                    ForEach(onboardingItems.indices, id: \.self) { item in
                        Image("onboarding\(item+1)")
                            .resizable()
                            .padding()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 170, height: 170)
                            .tag(item)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                HStack(spacing: 4) {
                    ForEach(onboardingItems.indices, id: \.self) { i in
                        Color(hex: "4158A6")
                            .opacity(i == index ? 1 : 0.5)
                            .frame(width: i == index ? 8 : 16, height: 8)
                            .animation(.easeInOut(duration: 0.4), value: i == index)
                    }
                }
                
                ZStack {
                    ForEach(onboardingItems.indices, id: \.self) { i in
                        VStack {
                            Text(onboardingItems[i].title)
                                .font(.largeTitle)
                                .foregroundColor(Color(hex: "4158A6"))
                            
                            Text(onboardingItems[i].description)
                                .foregroundColor(Color(hex: "4158A6"))
                                .multilineTextAlignment(.center)
                                .padding(9)
                        }
                        .opacity(i == index ? 1 : 0)
                        .offset(y: i == index ? 0 : 100)
                        .animation(.easeInOut, value: index)
                    }
                }
                
                Button {
                    coordinator.navigateToSignUp()  // SignUp ekranına geçiş yap
                } label: {
                    Text("Get Started")
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .background(Color(hex: "4158A6"))
                        .foregroundColor(Color(hex: "F5EDED"))
                        .cornerRadius(12)
                }
                .padding()
            }
        }
    }
}

#Preview {
    Onboarding()
        .environmentObject(NavigationCoordinator())
}
