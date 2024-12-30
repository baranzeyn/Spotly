//
//  DataUploadView.swift
//  Map
//
//  Created by Zeynep Baran on 29.12.2024.
//

import SwiftUI
import FirebaseFirestore
import MapKit

class DataUploadService: ObservableObject {
    @Published var isUploading = false
    @Published var uploadMessage: String?
    @Published var uploadComplete = false
    private let db = Firestore.firestore()
    
    func uploadInitialData(completion: @escaping (Bool) -> Void) {
        isUploading = true
        uploadMessage = "Veriler yükleniyor..."
        let locations = LocationsDataService.locations
        
        let batch = db.batch()
        
        locations.forEach { location in
            let docRef = db.collection("locations").document(location.id)
            
            let coordinates: [String: Any] = [
                "latitude": location.coordinates.latitude,
                "longitude": location.coordinates.longitude
            ]
            
            // Updated the location data to include sentiment properties and generalScore
            let locationData: [String: Any] = [
                "name": location.name,
                "cityName": location.cityName,
                "coordinates": coordinates,
                "description": location.description,
                "imageNames": location.imageNames,
                "link": location.link,
                // Added sentiment data
                "positiveSentiment": location.positiveSentiment,
                "negativeSentiment": location.negativeSentiment,
                "neutralSentiment": location.neutralSentiment,
                // Added generalScore data
                "generalScore": location.generalScore,
                // Add topics and keywords data
                "topicsAndKeywords": location.topicsAndKeywords.map { topic in
                    [
                        "topic": topic.id,
                        "name": topic.name,
                        "keywords": topic.keywords
                    ]
                }
            ]
            
            batch.setData(locationData, forDocument: docRef)
        }
        
        batch.commit { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.uploadMessage = "Hata: \(error.localizedDescription)"
                    self?.isUploading = false
                    completion(false)
                } else {
                    self?.uploadMessage = "Veriler başarıyla yüklendi!"
                    self?.isUploading = false
                    self?.uploadComplete = true
                    completion(true)
                }
            }
        }
    }
}
