//
//  ShortcutView.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import Foundation
import SwiftUI
import ShortcutRecorder

struct ShortcutView: View {
    let shortcut: AppShortcut

    var body: some View {
        VStack(alignment: .leading) {
            Text(shortcut.appName).fontWeight(.bold)
            Text(shortcut.description).font(.caption)
            Text(shortcutDisplayString(shortcut.keyCombination)).font(.caption).foregroundColor(.gray)
        }
        
    }
    func shortcutDisplayString(_ shortcut: Shortcut?) -> String {
            if let shortcut = shortcut {
                return shortcut.description
            } else {
                return "Kein Shortcut festgelegt"
            }
        }
}
