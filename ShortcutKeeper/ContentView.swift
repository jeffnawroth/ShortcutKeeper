//
//  ContentView.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ShortcutsViewModel()
    
    @State private var appName: String = ""
    @State private var description: String = ""
    @State private var keyCombination: String = ""
    
    
    var body: some View {

        List{
            ForEach(viewModel.shortcuts, id: \.id) { shortcut in
                ShortcutView(shortcut: shortcut)
            }
            .onDelete(perform: delete)
        }.scrollContentBackground(.hidden)
          
    }
    
    
    private func delete(at offsets: IndexSet) {
        viewModel.removeShortcut(at: offsets)
    }
}

#Preview {
    ContentView()
}


