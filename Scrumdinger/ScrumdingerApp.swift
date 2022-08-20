//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 18/08/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
