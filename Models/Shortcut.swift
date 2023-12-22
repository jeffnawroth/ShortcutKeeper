//
//  Shortcut.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import Foundation

struct Shortcut: Identifiable {
    var id = UUID()
    var keyCombination: String
    var appName: String
    var description: String
}
