//
//  HomeView.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/27/25.
//

import SwiftUI

struct HomeView: View {
    let weatherManager = WeatherManager()
    var recommender: OutfitRecommender {
        OutfitRecommender(weatherManager: weatherManager)
    }

    var body: some View {
        let outfit = recommender.recommendOutfit()

        return ZStack {
            Image("container1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            HStack {
                VStack(spacing: 20) {
                    ZStack {
                        Image("2Rectangle")
                            .frame(width: 200, height: 200)
                        WeatherView()
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

                ClotheSection(title: "Top", imageNames: outfit.top.map { $0.rawValue })
                ClotheSection(title: "Bottom", imageNames: outfit.bottom.map { $0.rawValue })
                ClotheSection(title: "Shoes", imageNames: outfit.shoes.map { $0.rawValue })



                Spacer(minLength: 40)
            }
            .padding(.horizontal, 60)
            .frame(maxWidth: 1000, maxHeight: 550)
        }
    }
}


#Preview {
    HomeView()
}
