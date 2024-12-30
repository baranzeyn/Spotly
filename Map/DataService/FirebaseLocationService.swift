//
//  FirebaseLocationService.swift
//  Map
//
//  Created by Zeynep Baran on 29.12.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import MapKit

class FirebaseLocationService {
    static let shared = FirebaseLocationService()
    private let db = Firestore.firestore()
    
    func uploadLocations() {
        let locations = LocationsDataService.locations
        
        locations.forEach { location in
            let coordinates: [String: Any] = [
                "latitude": location.coordinates.latitude,
                "longitude": location.coordinates.longitude
            ]
            
            // Prepare the data to include topics and keywords
            let locationData: [String: Any] = [
                "name": location.name,
                "cityName": location.cityName,
                "coordinates": coordinates,
                "description": location.description,
                "imageNames": location.imageNames,
                "link": location.link,
                "positiveSentiment": location.positiveSentiment,
                "negativeSentiment": location.negativeSentiment,
                "neutralSentiment": location.neutralSentiment,
                "generalScore": location.generalScore,
                // Add topics and keywords to Firestore
                "topicsAndKeywords": location.topicsAndKeywords.map { topic in
                    [
                        "topic": topic.id,
                        "name": topic.name,
                        "keywords": topic.keywords
                    ]
                }
            ]
            
            db.collection("locations")
                .document(location.id)
                .setData(locationData) { error in
                    if let error = error {
                        print("Error uploading \(location.name): \(error.localizedDescription)")
                    } else {
                        print("\(location.name) successfully uploaded.")
                    }
                }
        }
    }
    
    // Upload a single location
    func uploadSingleLocation(_ location: Location) {
        let coordinates: [String: Any] = [
            "latitude": location.coordinates.latitude,
            "longitude": location.coordinates.longitude
        ]
        
        let locationData: [String: Any] = [
            "name": location.name,
            "cityName": location.cityName,
            "coordinates": coordinates,
            "description": location.description,
            "imageNames": location.imageNames,
            "link": location.link,
            "positiveSentiment": location.positiveSentiment,
            "negativeSentiment": location.negativeSentiment,
            "neutralSentiment": location.neutralSentiment,
            "generalScore": location.generalScore,
            // Add topics and keywords to Firestore
            "topicsAndKeywords": location.topicsAndKeywords.map { topic in
                [
                    "topic": topic.id,
                    "name": topic.name,
                    "keywords": topic.keywords
                ]
            }
        ]
        
        db.collection("locations")
            .document(location.id)
            .setData(locationData) { error in
                if let error = error {
                    print("Error uploading \(location.name): \(error.localizedDescription)")
                } else {
                    print("\(location.name) successfully uploaded.")
                }
            }
    }
}
