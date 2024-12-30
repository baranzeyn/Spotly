//
//  LocationMapAnnotationView.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(accentColor)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-3)
                .padding(.bottom,40) // konumu kapamasın diye üstüne konumlandırdık
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationMapAnnotationView()
    }
}
