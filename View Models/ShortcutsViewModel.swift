//
//  ShortcutsViewModel.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import Foundation

class ShortcutsViewModel: ObservableObject {
    @Published var shortcuts: [Shortcut] = [
          Shortcut(keyCombination: "Cmd + Shift + A", appName: "Google", description: "Tabs suchen"),
          Shortcut(keyCombination: "Cmd + Option + I", appName: "Google", description: "Entwickler-Tools öffnen")
      ]
    
    @Published var addingNewShortcut = false

    func addShortcut(keyCombination: String, appName: String, description: String) {
        let newShortcut = Shortcut(keyCombination: keyCombination, appName: appName, description: description)
        shortcuts.append(newShortcut)
    }

    func removeShortcut(at index: IndexSet) {
        shortcuts.remove(atOffsets: index)
    }

    func updateShortcut(id: UUID, keyCombination: String, appName: String, description: String) {
        if let index = shortcuts.firstIndex(where: { $0.id == id }) {
            shortcuts[index].keyCombination = keyCombination
            shortcuts[index].appName = appName
            shortcuts[index].description = description
        }
    }
}

