//
//  HomeView.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/27/25.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    
    @State var weatherManager: WeatherManager
    
    var recommender: OutfitRecommender {
        OutfitRecommender(weatherManager: weatherManager)
    }
    @State var outfit: OutfitRecommender.Recommendation?
    
    let detroit = CLLocation(latitude: 42.3297, longitude: -83.0425)
    
    init(weatherManager: WeatherManager){
        self.weatherManager = weatherManager
    }
    var body: some View {
        

         ZStack {
            Image("container1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            HStack {
                VStack(spacing: 20) {
                    ZStack {
                        Image("2Rectangle")
                            .frame(width: 200, height: 200)
                        WeatherView(weatherManager: weatherManager)
                    }

                    Image("1Rectangle")
                        .frame(width: 300, height: 300)

                    ZStack {
                        Image("3rectangle")
                        CalendarView()
                    }
                }
                .padding(.leading, 20)

                Spacer()
            }

            VStack(spacing: 40) {
                VStack(spacing: 10) {
                    Text("DAILY RECOMMENDATION")
                        .font(.custom("Copperplate", size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)

                    Text("Here are today recommendations")
                        .font(.custom("Copperplate", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .padding(.top, 50)
                
                if let outfit = outfit {
                    ClotheSection(title: "Top", imageNames: outfit.top.map { $0.rawValue })
                    ClotheSection(title: "Bottom", imageNames: outfit.bottom.map { $0.rawValue })
                    ClotheSection(title: "Shoes", imageNames: outfit.shoes.map { $0.rawValue })
                }

               



                Spacer(minLength: 40)
            }
            .padding(.horizontal, 60)
            .frame(maxWidth: 1000, maxHeight: 550)
        }
        .onAppear {
            Task {
                await weatherManager.getWeather(
                    lat: detroit.coordinate.latitude,
                    long: detroit.coordinate.longitude
                )
                outfit = recommender.recommendOutfit()
            }
        }
    }
}

//
//#Preview {
//    HomeView()
//}
