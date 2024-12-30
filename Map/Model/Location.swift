//
//  Location.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import Foundation
import MapKit

struct Location:Identifiable,Equatable{
    let name:String
    let cityName:String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link:String
    
    // Added sentiment data
    let positiveSentiment: Double
    let negativeSentiment: Double
    let neutralSentiment: Double
    
    // Added general score
    let generalScore: Double
    // Added topics and keywords
    let topicsAndKeywords: [Topic]
    
    //identifiable
    var id:String {
        //name = "Colosseum"
        //cityname = "Rome"
        //id = "ColesseumRome"
        name + cityName
    }
    //equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
