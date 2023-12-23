//
//  ShortcutRecorderView.swift
//  ShortcutKeeper
//
//  Created by Jeff Nawroth on 23.12.23.
//

import Foundation

import SwiftUI
import ShortcutRecorder

// Definieren Sie ein Protokoll, das Ihre Ansicht benachrichtigt, wenn der Shortcut aufgenommen wurde.
protocol ShortcutRecorderDelegate {
    func didChangeShortcut(_ newShortcut: Shortcut)
}

struct ShortcutRecorderView: NSViewRepresentable {
    @Binding var shortcut: Shortcut?
    var delegate: ShortcutRecorderDelegate?
    
    class Coordinator: NSObject, RecorderControlDelegate {
        var parent: ShortcutRecorderView
        
        init(_ parent: ShortcutRecorderView) {
            self.parent = parent
        }
        
        func shortcutRecorderDidEndRecording(_ aRecorder: RecorderControl) {
            if let newShortcut = aRecorder.objectValue {
                parent.delegate?.didChangeShortcut(newShortcut)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeNSView(context: Context) -> RecorderControl {
        let recorder = RecorderControl()
        recorder.delegate = context.coordinator
        recorder.objectValue = shortcut
        // Anpassen des RecorderControl-Stils hier
        return recorder
    }
    
    func updateNSView(_ nsView: RecorderControl, context: Context) {
        nsView.objectValue = shortcut
    }
}

#Preview {
    ContentView()
}



