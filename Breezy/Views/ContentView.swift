//
//  ContentView.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    
    @State var weatherManager = WeatherManager()
    
    var body: some View {
        
        HomeView(weatherManager: weatherManager)

    }
}

#Preview {
    ContentView()
}
