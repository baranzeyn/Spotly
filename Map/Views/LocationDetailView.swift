//
//  Locationdeetailview.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    let location: Location
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    sentimentSection // Sentiment analysis section
                    Divider()
                    topicSection // Topics and Keywords section
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .background(.ultraThinMaterial)
        .ignoresSafeArea()
        .overlay(backButton, alignment: .topLeading)
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
        .cornerRadius(15)
        .padding(.bottom, 10)
    }
    
    private var titleSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(location.name)
                    .font(.largeTitle.weight(.semibold))
                    .foregroundColor(.primary)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Score displayed vertically with label and value on separate lines
            VStack(alignment: .trailing, spacing: 4) {
                Text("Score")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text("\(location.generalScore, specifier: "%.2f")%")
                    .font(.title2.weight(.bold))
                    .foregroundColor(scoreColor)
            }
            .padding(.trailing)
        }
        .padding(.horizontal)
        .padding(.top, 5)
    }
    
    private var scoreColor: Color {
        switch location.generalScore {
        case 70...: return .green
        case 50...: return .orange
        default: return .red
        }
    }

    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var sentimentSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sentiment Analysis")
                .font(.title2)
                .fontWeight(.semibold)
            
            HStack {
                Text("Positive: \(location.positiveSentiment, specifier: "%.2f")%")
                    .foregroundColor(.green)
                Spacer()
                Text("Negative: \(location.negativeSentiment, specifier: "%.2f")%")
                    .foregroundColor(.red)
            }
            
            HStack {
                Text("Neutral: \(location.neutralSentiment, specifier: "%.2f")%")
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical)
    }
    
    // Topic Section: Display Topics and Keywords
    private var topicSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Topics and Keywords")
                .font(.title2)
                .fontWeight(.semibold)
            
            ForEach(location.topicsAndKeywords) { topic in
                VStack(alignment: .leading, spacing: 8) {
                    Text(topic.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("Keywords: \(topic.keywords.joined(separator: ", "))")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.bottom, 10)
            }
        }
        .padding(.vertical)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundStyle(.black)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
