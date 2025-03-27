//
//  WeatherDataModel.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/24/25.
//

import Foundation
import WeatherKit

@Observable class WeatherManager {
    private let weatherService = WeatherService()
    var weather: Weather?
    
    func getWeather(lat: Double, long: Double) async {
        do {
            weather = try await Task.detached(priority: .userInitiated) { [weak self] in
                return try await self?.weatherService.weather(for: .init(latitude: lat, longitude: long))
            }.value
            
        } catch {
            print("Failed to get weather data. \(error)")
        }
    }

    var icon: String {
        guard let iconName = weather?.currentWeather.symbolName else { return "--" }
        
        return iconName
    }
    
    var temperature: String {
        guard let temp = weather?.currentWeather.temperature else { return "--" }
        let convert = temp.converted(to: .fahrenheit).value
        
        return String(Int(convert)) + "°F"
    }
}
