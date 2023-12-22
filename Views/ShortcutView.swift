//
//  ShortcutView.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import Foundation
import SwiftUI

struct ShortcutView: View {
    let shortcut: Shortcut

    var body: some View {
        VStack(alignment: .leading) {
            Text(shortcut.appName).fontWeight(.bold)
            Text(shortcut.description).font(.caption)
            Text(shortcut.keyCombination).font(.caption).foregroundColor(.gray)
            
//            Text(shortcut.keyCombination).fontWeight(.bold)
//            Text(shortcut.appName).font(.caption)
//            Text(shortcut.description).font(.caption).foregroundColor(.gray)
        }
    }
}
