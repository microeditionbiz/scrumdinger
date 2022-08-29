//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 27/08/2022.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    let skipAction: () -> Void

    private var speakerText: String {
        guard let speakerNumber = speakers.speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }

    var body: some View {
        HStack {
            if speakers.isLastSpeaker {
                Text("Last Speaker")
            } else {
                Text(speakerText)
                Spacer()
                Button(
                    action: skipAction,
                    label: {
                        Image(systemName: "forward.fill")
                    }
                )
                .accessibilityLabel("Next speaker")
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData.first!.attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
