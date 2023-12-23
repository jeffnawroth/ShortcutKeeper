//
//  ContentView.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 22.12.23.
//

import SwiftUI
import ShortcutRecorder

struct ContentView: View {
    
    @ObservedObject var viewModel = ShortcutsViewModel()
    
    var body: some View {
    
       AddShortcutView(viewModel: viewModel)
        
        List{
            ForEach(viewModel.shortcuts, id: \.id) { shortcut in
                ShortcutView(shortcut: shortcut)
            }
            .onDelete(perform: delete)
            .listRowBackground(Color.clear)
        }.scrollContentBackground(.hidden)
    }
        
    private func delete(at offsets: IndexSet) {
        viewModel.removeShortcut(at: offsets)
    }
}

#Preview {
    ContentView()
}


