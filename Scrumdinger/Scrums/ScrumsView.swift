//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 20/08/2022.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State var isPresentingNewScrumView = false
    @State private var newScrumData = DailyScrum.Data()

    var body: some View {
        List {
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(
                action: {
                    isPresentingNewScrumView = true
                    newScrumData = DailyScrum.Data()
                },
                label: { Image(systemName: "plus") })
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingNewScrumView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingNewScrumView = false
                                scrums.append(DailyScrum(data: newScrumData))
                            }
                        }
                    }
            }
        }

    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}
