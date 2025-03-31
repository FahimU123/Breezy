//
//  CalendarView.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/25/25.
//

import SwiftUI
import EventKit

struct CalendarView: View {
    @State private var calendar = CalendarEvents()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Today's Events")
                .font(.headline)
                .padding(.bottom, 4)
            
            ForEach(calendar.titles.prefix(3), id: \.self) { title in
                HStack {
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(.black)
                    Text(title)
                        .font(.subheadline)
                }
            }
            
        }
        .padding()
        .shadow(radius: 5)
        .onAppear {
            calendar.fetchEventsFromCalendar()
        }
    }
}

#Preview {
    CalendarView()
}
