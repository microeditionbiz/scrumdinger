//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 20/08/2022.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History]

    var data: Data {
        .init(
            title: title,
            attendees: attendees,
            lengthInMinutes: Double(lengthInMinutes),
            theme: theme
        )
    }

    struct Attendee: Identifiable, Codable {
        let id: UUID
        let name: String

        init(id: UUID = .init(), name: String) {
            self.id = id
            self.name = name
        }
    }

    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }

    init(id: UUID = .init(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme, history: [History] = []) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
        self.history = history
    }

    init(data: DailyScrum.Data) {
        self.id = .init()
        self.title = data.title
        self.attendees = data.attendees
        self.lengthInMinutes = Int(data.lengthInMinutes)
        self.theme = data.theme
        self.history = []
    }

    mutating func update(from scrum: Data) {
        title = scrum.title
        attendees = scrum.attendees
        lengthInMinutes = Int(scrum.lengthInMinutes)
        theme = scrum.theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        .init(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            lengthInMinutes: 10,
            theme: .yellow),
        .init(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
            lengthInMinutes: 5,
            theme: .orange),
        .init(
            title: "Web Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
            lengthInMinutes: 5,
            theme: .poppy)
    ]
}
