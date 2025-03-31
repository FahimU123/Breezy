//
//  WeatherView.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/24/25.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    
    let weatherManager: WeatherManager
    // why is this still needed?
    init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
    
    let detroit = CLLocation(latitude: 6.1944, longitude: 106.8229)

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

//#Preview {
//    WeatherView()
//}

//

//weathermonger is a class so its needs to always be initialized unlike structs which automatically have initializer, now because how my proejct is setup and content view leads to home view which also leads to weather view  and both of them need a weather manger I can just declare it in content view an d se it = to a weathermanger and just in home views and weather view just declare it and initialize it because classes always require intializations
