//
//  Shortcut.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import Foundation
import ShortcutRecorder

struct AppShortcut: Identifiable {
    var id = UUID()
    var keyCombination: Shortcut?
    var appName: String
    var description: String
}
