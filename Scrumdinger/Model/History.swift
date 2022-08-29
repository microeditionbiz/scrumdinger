//
//  History.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 29/08/2022.
//

import Foundation

struct History: Identifiable {
    let id = UUID()
    let date = Date()
    var attendees: [DailyScrum.Attendee]
    var lengthInMinutes: Int
}
