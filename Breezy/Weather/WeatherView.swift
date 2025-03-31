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
        VStack(spacing: 8) {
            Image(systemName: weatherManager.icon)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
                .shadow(radius: 4)
                .padding(.top, 8)

            Text("Detroit")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("\(weatherManager.temperature)°")
                .font(.title)
                .fontWeight(.semibold)
        }
        .onAppear {
            Task {
                await weatherManager.getWeather(
                    lat: detroit.coordinate.latitude,
                    long: detroit.coordinate.longitude
                )
            }
        }
    }
}

#Preview {
    WeatherView()
}
