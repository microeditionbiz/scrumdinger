//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 20/08/2022.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID = UUID()
    let title: String
    let attendees: [Attendee]
    let lengthInMinutes: Int
    let theme: Theme

    struct Attendee: Identifiable {
        let id: UUID = UUID()
        let name: String
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        .init(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"].map(Attendee.init),
            lengthInMinutes: 10,
            theme: .yellow),
        .init(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"].map(Attendee.init),
            lengthInMinutes: 5,
            theme: .orange),
        .init(
            title: "Web Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"].map(Attendee.init),
            lengthInMinutes: 5,
            theme: .poppy)
    ]
}
