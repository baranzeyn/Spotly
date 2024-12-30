//
//  SplashView.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size=0.8
    @State private var opacity=0.5
    var body: some View {
        if isActive{
            Onboarding()
        }else{
            ZStack{
                Color.accentColor
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                VStack{
                    Image("mapapp")
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    Text("Spotly")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size=0.9
                        self.opacity=1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive=true
                    }
                }
            }
          }
        }
    }
}

#Preview {
    SplashView()
}

