//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 18/08/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            fatalError("Error saving scrums.")
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    store.scrums = []
                }
            }

//            .onAppear() {
//                store.scrums = await ScrumStore.load()
//            }
        }
    }
}
