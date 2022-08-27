//
//  ScrumProgressViewStyle.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 27/08/2022.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    let theme: Theme

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(theme.accentColor)
                .frame(height: 20)
            ProgressView(configuration)
                .tint(theme.mainColor)
                .frame(height: 12)
                .padding(.horizontal)
        }
    }

}

struct ScrumProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.4)
            .progressViewStyle(ScrumProgressViewStyle(theme: .buttercup))
            .previewLayout(.sizeThatFits)
    }
}

