//
//  History.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 29/08/2022.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var lengthInMinutes: Int

    internal init(id: UUID = .init(), date: Date = .init(), attendees: [DailyScrum.Attendee], lengthInMinutes: Int) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}
