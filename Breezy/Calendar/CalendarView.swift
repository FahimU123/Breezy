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
        List(calendar.titles, id: \.self) { title in
                Text(title)
            }
            .onAppear {
                    calendar.fetchEventsFromCalendar()
        }
    }

  
}

#Preview {
    CalendarView()
}
