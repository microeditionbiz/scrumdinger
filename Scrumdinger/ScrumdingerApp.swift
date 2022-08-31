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
                    store.save { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear() {
                store.load()
            }
        }
    }
}
