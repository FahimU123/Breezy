//
//  CalendarEvents.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/25/25.
//

import EventKit

class CalendarEvents {
    let eventStore = EKEventStore()
    var titles: [String] = ["fake data", "more fake data"]
    var startDates: [Date] = [Date(), Date()]
    var endDates: [Date] = [Date(), Date()]
    
    
    func fetchEventsFromCalendar() -> Void {
            let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
            switch status {
            case .notDetermined: requestAccessToCalendar("Calendar")
            case .authorized: fetchEventsFromCalendar("Calendar")
            case .denied: print("Access denied")
            default: break
            }
        }

    func requestAccessToCalendar(_ calendarTitle: String) {
            eventStore.requestAccess(to: EKEntityType.event) { (_, _) in
                self.fetchEventsFromCalendar(calendarTitle)
            }
        }

    func fetchEventsFromCalendar(_ calendarTitle: String) -> Void {
            for calendar in eventStore.calendars(for: .event) {
                if calendar.title == calendarTitle {
                    let oneMonthAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
                    let oneMonthAfter = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
                    let predicate = eventStore.predicateForEvents(
                        withStart: oneMonthAgo,
                        end: oneMonthAfter,
                        calendars: [calendar]
                    )
                    let events = eventStore.events(matching: predicate)
                    for event in events {
                        titles.append(event.title)
                        startDates.append(event.startDate as Date)
                        endDates.append(event.endDate as Date)
                }
            }
        }
    }
}
