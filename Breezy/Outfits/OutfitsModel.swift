//
//  OutfitsModel.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/26/25.
//

import Foundation

class OutfitRecommender {
    
    enum Top: String {
        case tshirt = "tshirt"
        case sweater = "sweater"
        case jacket = "jacket"
        case coat = "coat"
        case tank = "tank"
    }
    
    enum Bottom: String {
        case shorts = "shorts"
        case pants = "pants"
        case jeans = "jeans"
        case skirt = "skirt"
    }
    
    enum Shoes: String {
        case sneakers = "sneakers"
        case boots = "boots"
        case sandals = "sandals"
    }
    
    struct Recommendation {
        let top: [Top]
        let bottom: [Bottom]
        let shoes: [Shoes]
    }
    
    let weatherManager: WeatherManager
    
    init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
    
    func recommendOutfit() -> Recommendation {
        guard let weather = weatherManager.weather else {
            return Recommendation(
                top: [.tshirt, .coat],
                bottom: [.jeans, .pants],
                shoes: [.sneakers, .boots]
            )
        }

        let temp = weather.currentWeather.temperature.converted(to: .fahrenheit).value

        switch temp {
        case ..<32:
            return Recommendation(top: [.coat], bottom: [.pants], shoes: [.boots])
        case 32..<50:
            return Recommendation(top: [.jacket], bottom: [.jeans], shoes: [.boots])
        case 50..<65:
            return Recommendation(top: [.sweater], bottom: [.jeans], shoes: [.sneakers])
        case 65..<75:
            return Recommendation(top: [.tshirt], bottom: [.jeans], shoes: [.sneakers])
        case 75..<85:
            return Recommendation(top: [.tshirt], bottom: [.shorts], shoes: [.sandals])
        default:
            return Recommendation(top: [.tank], bottom: [.shorts], shoes: [.sandals])
        }
    }


}
