//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 18/08/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
