//
//  WeatherView.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/24/25.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    
    @State private var weatherManager = WeatherManager()

    
    let detroit = CLLocation(latitude: 42.3297, longitude: -83.0425)
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: weatherManager.icon)
                .font(.largeTitle)
                .shadow(radius: 2)
                .padding()
            Text("Detroit")
            Text("Temperature: \(weatherManager.temperature)")

        }
        .onAppear {
            Task {
                await weatherManager.getWeather(lat: detroit.coordinate.latitude, long: detroit.coordinate.longitude)
            }
        }
        .font(.title3)
    }
}
#Preview {
    WeatherView()
}
