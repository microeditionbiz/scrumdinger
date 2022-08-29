//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 20/08/2022.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID = UUID()
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []

    var data: Data {
        Data(
            title: title,
            attendees: attendees,
            lengthInMinutes: Double(lengthInMinutes),
            theme: theme)
    }

    struct Attendee: Identifiable {
        let id: UUID = UUID()
        let name: String
    }

    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }

    mutating func update(from scrum: Data) {
        title = scrum.title
        attendees = scrum.attendees
        lengthInMinutes = Int(scrum.lengthInMinutes)
        theme = scrum.theme
    }
}

extension DailyScrum {
    init(data: DailyScrum.Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
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
