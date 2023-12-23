//
//  ShortcutsViewModel.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import Foundation
import ShortcutRecorder

class ShortcutsViewModel: ObservableObject {
    @Published var shortcuts: [AppShortcut] = [
          AppShortcut(keyCombination: Shortcut(keyEquivalent: "⇧⌘A"), appName: "Google", description: "Tabs suchen"),
          AppShortcut(keyCombination: Shortcut(keyEquivalent: "⇧⌘A"), appName: "Google", description: "Entwickler-Tools öffnen")
      ]

    func addShortcut(keyCombination: Shortcut, appName: String, description: String) {
        let newShortcut = AppShortcut(keyCombination: keyCombination, appName: appName, description: description)
        shortcuts.append(newShortcut)
    }

    func removeShortcut(at index: IndexSet) {
        shortcuts.remove(atOffsets: index)
    }

    func updateShortcut(id: UUID, keyCombination: Shortcut, appName: String, description: String) {
        if let index = shortcuts.firstIndex(where: { $0.id == id }) {
            shortcuts[index].keyCombination = keyCombination
            shortcuts[index].appName = appName
            shortcuts[index].description = description
        }
    }
}

