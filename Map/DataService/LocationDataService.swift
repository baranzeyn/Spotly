//
//  LocationDataService.swift
//  Map
//
//  Created by Zeynep Baran on 27.12.2024.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Ephesus",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 37.941113, longitude: 27.341944),
            description: "Ephesus (Ancient Greek: Ephesos) was an ancient Greek city located on the west coast of Anatolia, within the borders of the Selçuk district of today's İzmir province, and later became an important Roman city. It was one of the twelve cities of Ionia in the classical Greek era. Its foundation dates back to the Polished Stone Age 6000 BC.",
            imageNames: [
                "izmir-ephesus-1",
                "izmir-ephesus-2",
            ],
            link: "https://en.wikipedia.org/wiki/Ephesus",
            positiveSentiment: 86.11, negativeSentiment: 13.19, neutralSentiment: 0.69, generalScore: 86.24,
            topicsAndKeywords: [
                            Topic(id: 1, name: "Antik Çağ ve Efes'in İzleri", keywords: ["antik", "efes", "gez", "harika", "bura"]),
                            Topic(id: 2, name: "Tarihi Alanlar", keywords: ["tarihi", "muhteşem", "yer", "görme", "dünya"])
                        ]
        ),
        Location(
            name: "Kadifekale",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 38.413712, longitude: 27.144039),
            description: "Kadifekale is the area where the city was re-established in Pagos (Kadife Mountain), except for the old Izmir (Smyrna). Founded in the 4th century BC, the city has ruins from the Hellenistic, Roman, Byzantine and Ottoman periods, which have survived to this day. Kadifekale is located in the south of the city on a 186 meters high hill.",
            imageNames: [
                "izmir-kadifekale-1",
                "izmir-kadifekale-2",
            ],
            link: "https://en.wikipedia.org/wiki/Kadifekale",
            positiveSentiment: 48.76, negativeSentiment: 48.26, neutralSentiment: 2.99, generalScore: 48.67,
            topicsAndKeywords: [
                            Topic(id: 1, name: "Tarihi Alanlar", keywords: ["tarihi", "yer", "manzara", "güzel", "kale"]),
                            Topic(id: 2, name: "Manzara ve Kadifekale", keywords: ["manzara", "kadifekale", "güzel", "duvar", "guzel"])
                        ]
        ),
        Location(
            name: "Agora Ruins",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 38.4237, longitude: 27.1428),
            description: "İzmir agora was established on the north facing slope of Pagos (Kadifekale) where the ancient city of Smyrna was moved in the 4th century BC. Surrounded by important public buildings of its period, the Agora building was the Capitol building of Smyrna city state. Most of the surviving ruins in The Agora, which was established in the Hellenistic period, belongs to the Roman period, which was rebuilt with the support of Emperor Marcus Aurelius after an earthquake in 178 AD.",
            imageNames: [
                "izmir-agora-1",
                "izmir-agora-2",
            ],
            link: "https://en.wikipedia.org/wiki/Agora",
            positiveSentiment: 66.31, negativeSentiment: 32.61, neutralSentiment: 1.08, generalScore: 67.47,
            topicsAndKeywords: [
                            Topic(id: 1, name: "Tarihi Alanlar", keywords: ["tarihi", "yer", "agora", "merkez", "görülmeli"]),
                            Topic(id: 2, name: "Müze ve Orta", keywords: ["müze", "orta", "agora", "zaman", "açık"])
                        ]
        ),
        Location(
            name: "Alsancak",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 38.4240, longitude: 27.1325),
            description: "Alsancak, one of the central districts of Izmir, is the heart of entertainment. Every street of Alsancak, which is a meeting point, is beautiful. Kıbrıs Şehitleri Street is one of the streets that you should definitely see and visit. While wandering, you will come across historical houses, structures and churches. You will be greeted by interesting and stylish shops, cafes and restaurants on each street.",
            imageNames: [
                "izmir-alsancak-1",
                "izmir-alsancak-2",
            ],
            link: "https://en.wikipedia.org/wiki/Alsancak",
            positiveSentiment: 72.07, negativeSentiment: 26.1, neutralSentiment: 1.83, generalScore: 73.33,
            topicsAndKeywords: [
                            Topic(id: 1, name: "Popüler Lokasyonlar", keywords: ["yer", "merkez", "semt", "alışveriş", "güzel"]),
                            Topic(id: 2, name: "Sahil Şeridi", keywords: ["güzel", "kordon", "yer", "keyif", "eski"])
                        ]
        ),
        Location(
            name: "Kemeraltı",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 38.4192, longitude: 27.1287),
            description: "Kemeraltı is one of the world's largest historical open-air bazaars and has been İzmir's commercial center since the 17th century. The current Kemeraltı Bazaar, which was formed by the filling of the sea, was used as a harbor in the past. You can find everything you are looking for in Kemeraltı. This magnificent bazaar hosts an important cultural heritage waiting for you to discover, as well as colorful and different shops.",
            imageNames: [
                "izmir-kemeralti-bazaar-1",
                "izmir-kemeralti-bazaar-2",
            ],
            link: "https://en.wikipedia.org/wiki/Kemeralt%C4%B1",
            positiveSentiment: 60.95, negativeSentiment: 37.51, neutralSentiment: 1.54, generalScore: 61.54,
            topicsAndKeywords: [
                            Topic(id: 1, name: "Tarihi Alanlar", keywords: ["tarihi", "eski", "çarşı", "kemeral", "kahve"]),
                            Topic(id: 2, name: "Popüler Lokasyonlar", keywords: ["çarşı", "yer", "güzel", "kemeral", "alışveriş"])
                        ]
        ),
        Location(
            name: "İnciraltı",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 38.4039, longitude: 27.0306),
            description: "Inciralti has been one of the favorite places of weekend trips of Izmir residents since ancient times. The area where there are fish restaurants on the beach, flower greenhouses and large mandalin gardens has been brought back to life as a large recreation area with the new arrangements made.",
            imageNames: [
                "izmir-inciralti-1",
                "izmir-inciralti-2",
            ],
            link: "https://en.wikipedia.org/wiki/%C4%B0nciralt%C4%B1",
            positiveSentiment: 57.24, negativeSentiment: 38.16, neutralSentiment: 4.61, generalScore: 59.03,
            topicsAndKeywords: [
                   Topic(id: 1, name: "Popüler Lokasyonlar", keywords: ["yer", "orman", "mangal", "nefes", "alan"]),
                   Topic(id: 2, name: "Merkezde Doğa ve Estetik Dokular", keywords: ["güzel", "dok", "yeşil", "merkez", "tem"])
               ]
        ),
        Location(
            name: "İzmir Wildlife Park",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 38.4711, longitude: 27.0483),
            description: "The Wildlife Park, where animals freely live in the animal houses designed specifically for them and similar to their natural habitats and where the city as well as the urbanites take a deep breath with thousands of trees and plants in it, has become one of the centers of attraction in İzmir in a short period of time.",
            imageNames: [
                "izmir-wildlifepark-1",
                "izmir-wildlifepark-2"
            ],
            link: "https://en.wikipedia.org/wiki/%C4%B0zmir_Wildlife_Park",
            positiveSentiment: 58.47, negativeSentiment: 39.44, neutralSentiment: 2.09, generalScore: 63.09,
            topicsAndKeywords: [
                    Topic(id: 1, name: "Aile Boyu Doğa ve Hayvan Deneyimi", keywords: ["çocuk", "hayvan", "güzel", "yer", "alan"]),
                    Topic(id: 2, name: "Doğa Severler için Mekanlar", keywords: ["doğal", "park", "yaşa", "güzel", "yer"])
                ]
        ),
        Location(
            name: "The Elevator",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 38.4311, longitude: 27.1442),
            description: "The building, made between two streets in order to eliminate the altitude difference, is a tower containing two elevator cages. There is an altitude difference of 50 m between those 2 streets and the other way to overcome this difference is to climb a staircase with 155 steps. Therefore in 1907, a Jewish businessman “Nesim Levi” had this elevator constructed in order to facilitate the transportation.",
            imageNames: [
                "izmir-elevator-1",
                "izmir-elevator-2"
            ],
            link: "https://en.wikipedia.org/wiki/%C4%B0zmir_Wildlife_Park",
            positiveSentiment: 71.13, negativeSentiment: 26.85, neutralSentiment: 2.03, generalScore: 72.42,
            topicsAndKeywords: [
                    Topic(id: 1, name: "Tarihi Asansör ve Sokak Manzaraları", keywords: [
                        "asansör",
                        "güzel",
                        "sokak",
                        "manzara",
                        "moreno"
                    ]),
                    Topic(id: 2, name: "Güzel Manzara", keywords: ["manzar",
                                                                   "manzara",
                                                                   "tarihi",
                                                                   "yer",
                                                                   "güzel"])
                ]
            
        ),
        Location(
            name: "Clock Tower",
            cityName: "İzmir",
            coordinates: CLLocationCoordinate2D(latitude: 38.4180, longitude: 27.1239),
            description: "The Clock Tower built in 1901 by Sultan Abdulhamid II to commemorate his 25th anniversary on the throne, is indeed a significant example of the Orientalist style in Türkiye. Designed by Raymond Charles Péré, it reflects a blend of Ottoman and Western architectural influences.",
            imageNames: [
                "izmir-clocktower-1",
                "izmir-clocktower-2",
            ],
            link: "https://en.wikipedia.org/wiki/%C4%B0zmir_Clock_Tower",
            positiveSentiment: 73.14, negativeSentiment: 25.15, neutralSentiment: 1.71, generalScore: 73.76,
            topicsAndKeywords: [
                    Topic(id: 1, name: "İzmir’in Simgesi: Saat Kulesi", keywords: ["kule", "saat", "simge", "güzel", "yer"]),
                    Topic(id: 2, name: "Tarihi Alanlar", keywords: ["tarihi", "buluş", "ızmir", "merkez", "yer"])
                ]
        )
    ]
}
