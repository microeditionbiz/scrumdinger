//
//  ThemePickerView.swift
//  Scrumdinger
//
//  Created by Pablo Ezequiel Romero Giovannoni on 21/08/2022.
//

import SwiftUI

struct ThemePickerView: View {
    @Binding var selection: Theme

    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
//        .pickerStyle(.inline)
    }
}

struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePickerView(selection: .constant(.periwinkle))
    }
}
