//
//  ClothesSection.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/27/25.
//

import SwiftUI

struct ClotheSection: View {
    let title: String
    let imageNames: [String]
    @State private var isExpanded: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                        .imageScale(.medium)
                }
            }

            if isExpanded {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(imageNames, id: \.self) { name in
                            VStack(spacing: 8) {
                                Image(name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .background(Color.white)
                                    .cornerRadius(14)
                                    .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)

                                Text(name.capitalized)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.top, 5)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
        .background(Color.white.opacity(0.25))
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
        .frame(minHeight: 250)
    }
}



//#Preview {
//    ClotheSection(title: "Tops", imageName: "sweater")
//        .frame(width: 1000)
//        .padding()
//        .background(Color(red: 232.0 / 255.0, green: 227.0 / 255.0, blue: 252.0 / 255.0))
//}


