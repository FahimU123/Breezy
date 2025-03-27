//
//  ContentView.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        CameraView(image: $viewModel.currentFrame)
    }
}

#Preview {
    ContentView()
}
