//
//  ViewModel.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//
import SwiftUI
import MapKit
import FirebaseFirestore

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []
    @Published var mapLocation: Location?
    @Published var mapRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList: Bool = false
    @Published var sheetLocation: Location? = nil
    
    private let db = Firestore.firestore()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init() {
        print("ViewModel initialized")
        loadLocalLocations()
        fetchLocations()
    }
    
    private func loadLocalLocations() {
        print("Loading local locations")
        let localLocations = LocationsDataService.locations
        self.locations = localLocations
        if let firstLocation = localLocations.first {
            self.mapLocation = firstLocation
            self.updateMapRegion(location: firstLocation)
        }
    }
    
    func fetchLocations() {
        isLoading = true
        errorMessage = nil
        print("Fetching locations from Firebase...")
        
        db.collection("locations").getDocuments { [weak self] snapshot, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    print("Firebase error: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    print("No documents found")
                    self.errorMessage = "Veri bulunamadı"
                    return
                }
                
                let firebaseLocations = documents.compactMap { document -> Location? in
                    let data = document.data()
                    print("Processing document: \(data)")
                    
                    guard let name = data["name"] as? String,
                          let cityName = data["cityName"] as? String,
                          let coordinatesData = data["coordinates"] as? [String: Any],
                          let latitude = coordinatesData["latitude"] as? Double,
                          let longitude = coordinatesData["longitude"] as? Double,
                          let description = data["description"] as? String,
                          let imageNames = data["imageNames"] as? [String],
                          let link = data["link"] as? String,
                          let positiveSentiment = data["positiveSentiment"] as? Double,
                          let negativeSentiment = data["negativeSentiment"] as? Double,
                          let neutralSentiment = data["neutralSentiment"] as? Double,
                          let generalScore = data["generalScore"] as? Double,
                          let topicsAndKeywordsData = data["topicsAndKeywords"] as? [[String: Any]] else {
                        print("Failed to parse document: \(document.documentID)")
                        return nil
                    }
                    
                    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    
                    // Parse topics and keywords
                    let topicsAndKeywords = topicsAndKeywordsData.compactMap { topicData -> Topic? in
                        guard let id = topicData["topic"] as? Int,
                              let name = topicData["name"] as? String,
                              let keywords = topicData["keywords"] as? [String] else {
                            return nil
                        }
                        return Topic(id: id, name: name, keywords: keywords)
                    }
                    
                    return Location(
                        name: name,
                        cityName: cityName,
                        coordinates: coordinates,
                        description: description,
                        imageNames: imageNames,
                        link: link,
                        positiveSentiment: positiveSentiment,
                        negativeSentiment: negativeSentiment,
                        neutralSentiment: neutralSentiment,
                        generalScore: generalScore,
                        topicsAndKeywords: topicsAndKeywords
                    )
                }
                
                if !firebaseLocations.isEmpty {
                    print("Using \(firebaseLocations.count) locations from Firebase")
                    self.locations = firebaseLocations
                    if let firstLocation = firebaseLocations.first {
                        self.mapLocation = firstLocation
                        self.updateMapRegion(location: firstLocation)
                    }
                }
            }
        }
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
            updateMapRegion(location: location)
        }
    }
    
    func nextButtonPressed() {
        guard let currentLocation = mapLocation,
              let currentIndex = locations.firstIndex(where: { $0 == currentLocation }) else {
            return
        }
        
        let nextIndex = currentIndex + 1
        
        if locations.indices.contains(nextIndex) {
            let nextLocation = locations[nextIndex]
            showNextLocation(location: nextLocation)
        } else if let firstLocation = locations.first {
            showNextLocation(location: firstLocation)
        }
    }
}
