//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 20/08/2022.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
